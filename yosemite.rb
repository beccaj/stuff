require 'nokogiri'
require "rails"
require "mechanize"
URL = "http://www.recreation.gov"
# URL = "http://www.recreation.gov/unifSearchResults.do"
CAMPSITES = [
  "http://www.recreation.gov/camping/Lower_Pines/r/campsiteCalendar.do?page=calendar&search=site&contractCode=NRSO&parkId=70928",
  "http://www.recreation.gov/camping/Upper_Pines/r/campsiteCalendar.do?page=calendar&search=site&contractCode=NRSO&parkId=70925",
  "http://www.recreation.gov/camping/Tuolumne_Meadows/r/campsiteCalendar.do?page=calendar&search=site&contractCode=NRSO&parkId=70926",
  "http://www.recreation.gov/camping/Bridalveil_Creek_Group_And_Horse_Camp/r/campsiteCalendar.do?page=calendar&search=site&contractCode=NRSO&parkId=70931",
  "http://www.recreation.gov/camping/Wawona/r/campsiteCalendar.do?page=calendar&search=site&contractCode=NRSO&parkId=70924",
  "http://www.recreation.gov/camping/Crane_Flat/r/campsiteCalendar.do?page=calendar&search=site&contractCode=NRSO&parkId=70930",
  "http://www.recreation.gov/camping/Hodgdon_Meadow/r/campsiteCalendar.do?page=calendar&search=site&contractCode=NRSO&parkId=70929"
]

NEARBY = [
  "http://www.recreation.gov/camping/Dimond_O/r/campsiteCalendar.do?page=calendar&search=site&contractCode=NRSO&parkId=73632",
  "http://www.recreation.gov/camping/summerdale-campground/r/campgroundDetails.do?contractCode=NRSO&parkId=73745"

]

PARK_NAME = "YOSEMITE NATIONAL PARK, YOSEMITE VILLAGE, CA 95389, USA"

# <input type='radio' name='availability' value='online_av'  onclick='UnifSearchEngine.applyAvailabilityFilter();return false;'  id='rb_availability_online_av' title='Available to book online'/><label for='rb_availability_online_av' >Available to book online</label>
# <div class="filter camping"><input type='radio' name='category' value='camping' checked  id='rb_category_camping' title=''/>  <label testt="rb_category_camping" test="rb_category_camping" for="rb_category_camping" class="categoryFilterLabel">  <div class="pin"></div>Campgrounds  <span class="labelQty">&nbsp;(459)</span></label></div>

# <div id='departure_date_id' class='itemFilter'>
# <input type='text' value='Fri Sep 04 2015'  maxlength='100' name='departureDate' id='departureDate' onchange='this.value=toDateString(readDate(this.value));' onfocus='onFocusShowIframePopup(this,"popupCalendar",100,-110);' class='form-control dateField' placeholder='Departure Date'/>
# <script type="text/javascript"> try { new OverText("departureDate") } catch(err){}</script>
# </div><div ><select name='flexDates' id='flexDates'    ><option selected='selected' value=''>Not Flexible</option><option  value='2w'>next 2 weeks</option><option  value='4w'>next 4 weeks</option></select></div>
# <div class='input-group-btn'><a href='#' class='btn btn-default' title='Check Dates'   onclick='UnifSearchEngine.applyAvailabilityFilter();return false;'  >Check Dates</a></div>
# <div id='avail_options_content' class='filterContent'>
# <div class='filterTitle'>Show Results:</div><DIV  class='itemFilter'><input type='radio' name='availability' value='all' checked  id='rb_availability_all' title='All'/><label for='rb_availability_all' >All</label></DIV><DIV  class='itemFilter'><input type='radio' name='availability' value='all_av'  onclick='UnifSearchEngine.applyAvailabilityFilter();return false;'  id='rb_availability_all_av' title='Available to book'/><label for='rb_availability_all_av' >Available to book</label></DIV><DIV  class='itemFilter'><input type='radio' name='availability' value='online_av'  onclick='UnifSearchEngine.applyAvailabilityFilter();return false;'  id='rb_availability_online_av' title='Available to book online'/><label for='rb_availability_online_av' >Available to book online</label></DIV>
# <div class='itemFilter clearlink'><a href='#'   onclick='UnifSearchEngine.clearAvailabilityFilter();return false;'  >Clear Dates</a></div></div></div></div>
# <div id='states_filter' class='filter_section'>
agent = Mechanize.new
page = agent.get(URL)


# PARK_NAME = "YOSEMITE NATIONAL PARK, YOSEMITE VILLAGE, CA 95389, USA"