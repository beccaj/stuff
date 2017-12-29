require 'net/http'
require 'rubygems'
require 'nokogiri'     
require 'open-uri'
require 'date'
require 'json'
require 'set'
require 'csv'

def filter(destination)
  # destination.length > 10
  destination.length > 7 or (destination.length > 4 and destination.difficulty > 1)
end


class Destination
  attr_accessor :lat, :lon, :link, :name, :length, :city, :skill_level, :season, :trailhead_elevation, :top_elevation, :elevation_gain, :austin_distance, :houston_distance, :austin_time, :houston_time

  include Comparable
  def <=>(other)
    result = 0
    result = compare_city(other)
    result = compare_difficulty(other) if result == 0
    result = self.length <=> other.length if result == 0 
    result = self.gain <=> other.gain if result == 0
    result
  end

  def compare_city(other)
    # (other.austin_distance + other.houston_distance) - (self.austin_distance + self.houston_distance)
    (other.austin_distance) - (self.austin_distance)
    # (other.houston_distance) - (self.houston_distance)
  end

  def compare_difficulty(other)
    self.difficulty - other.difficulty
  end

  def gain 
    return self.elevation_gain if self.elevation_gain
    if self.top_elevation and self.trailhead_elevation
      return self.top_elevation - self.trailhead_elevation
    end
    return 0
  end

  def difficulty
    mydiff = nil
    i= 0
    diffs = [["very easy", 0], ["easy to moderate", 2], ["easy",1],  ["moderate to difficult", 4], ["difficult to strenuous", 6], ["very strenuous", 9], ["moderately strenuous", 7], ["difficult to strenuous", 7], ["moderate", 3],["more challenging", 4], ["strenuous", 8], ["difficult", 5]]

    diffs.each do |diff| 
      mydiff = diff[1] if !mydiff and self.skill_level and self.skill_level.downcase.include? diff[0]
    end
    mydiff = -1 if !mydiff
    mydiff
  end
end

@folder = "/src/stuff/destinations/"
@base_folder = "/src/stuff/"

AUSTIN_ORIGIN = "1501%20W%20North%20Loop%20Blvd%20Austin%20TX"
HOUSTON_ORIGIN = "5030%20cave%20run%20dr%2077459"



def download_files
  url = "http://www.rei.com/guidepost/list/texas/hiking/tx/7"
  page = Nokogiri::HTML(open(url))   
  list = page.css("ul.list-venue-name")
  items = list.css("li a")#[0,3]
  base_url = "http://www.rei.com/"
  destinations = []

  items.each do |item|
    link = base_url + item['href']
    puts "url: #{link}"

    page = open(link).read
    destination = item.text.downcase.gsub(/[()+ \/,:]/,"-")
    filename = @folder + destination + ".html"
    puts "Destination: #{filename}\n\n"
    File.write(filename, page)
  end
end

def valid_data(data)
   data["routes"] and data["routes"][0] and  data["routes"][0]["legs"]and data["routes"][0]["legs"][0]["duration"] and data["routes"][0]["legs"][0]["duration"]["value"]
end

def get_google_distance(origin, destination, distances, invalid)
  line = []

  url = "http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&sensor=false"

  response = Net::HTTP.get_response(URI.parse(url)).body
  data = JSON.parse(response)
  if valid_data(data)
    value = data["routes"][0]["legs"][0]["duration"]["value"]
    text = data["routes"][0]["legs"][0]["duration"]["text"]

    distances[destination] = [value, text]
    line << value.to_s
    line << text.to_s
  else
    line << nil
    line << nil
    invalid.add destination#destination.gsub("%20", " ")
  end
  line
end

def write_city_distance_csv(dests, filename) # run once to write csv that stores distances
  @austin_distances = {} 
  @houston_distances = {}
  invalid = Set.new

  origin = "austin"
  filename = @base_folder + filename
  CSV.open(filename, "wb") do |csv|
    csv << ["City","AustinTime","AustinDist","HoustonTime","HoustonDist"]
    dests.each do |dest|
      destination = dest.city.downcase.gsub " ", "%20"
      destination << ",tx"

      line = []
      if !@austin_distances[destination]
        line << dest.city.downcase
        origin = "austin"
        get_google_distance(origin, destination, @austin_distances, invalid).map {|i| line << i}
      end
      if !@houston_distances[destination]
        origin = "houston"
        get_google_distance(origin, destination, @houston_distances, invalid).map {|i| line << i}
      end  
      csv << line if line.length > 1
      puts "Line: #{line}" if line.length > 1
      sleep 1
    end
  end

  puts "INVALID CITIES:"
  invalid.map {|i| puts i}


end

def write_distance_csv(dests, filename) # run once to write csv that stores distances
  @austin_distances = {} 
  @houston_distances = {}
  invalid = Set.new

  origin = AUSTIN_ORIGIN # "austin"
  filename = @base_folder + filename
  CSV.open(filename, "wb") do |csv|
    csv << ["City","AustinTime","AustinDist","HoustonTime","HoustonDist"]
    dests.each do |dest|
      destination = "#{dest.lat},#{dest.lon}"

      line = []
      if !@austin_distances[destination]
        line << dest.name.downcase
        origin = AUSTIN_ORIGIN
        distance = get_google_distance(origin, destination, @austin_distances, invalid)
        if distance.include? nil
          destination = dest.city.downcase.gsub(" ", "%20") + ",tx"
          distance = get_google_distance(origin, destination, @austin_distances, invalid)
        end

        distance.map {|i| line << i}
      end
      if !@houston_distances[destination]
        origin = HOUSTON_ORIGIN 
        distance = get_google_distance(origin, destination, @houston_distances, invalid)
        if distance.include? nil
          destination = dest.city.downcase.gsub(" ", "%20") + ",tx"
          distance = get_google_distance(origin, destination, @houston_distances, invalid)
        end

        distance.map {|i| line << i}
      end  
      line << dest.lat
      line << dest.lon


      csv << line if line.length > 1
      puts "Line: #{line}" if line.length > 1
      sleep 1
    end
  end

  puts "INVALID CITIES:"
  invalid.map {|i| puts i}

end

@austin_distances = {}
@houston_distances = {}



def construct_distances
  CSV.foreach(@base_folder + "/distances.csv", {:headers=>true}) do |row|
    city = row["City"]
    austinTime = row["AustinTime"] ? row["AustinTime"] : 999999999
    austinDist = row["AustinDist"] ? row["AustinDist"] : "-"
    houstonTime = row["HoustonTime"] ? row["HoustonTime"] : 999999999
    houstonDist = row["HoustonDist"] ? row["HoustonDist"] : "-"

    @austin_distances[city] = [austinTime.to_i, austinDist]
    @houston_distances[city] = [houstonTime.to_i, houstonDist]

    puts "#{@austin_distances[city]}, #{@houston_distances[city]}"
  end
end



def parse_row(section, value, destination)
  case section
  when "Nearby City"
    destination.city = value
  when "Length"
    destination.length = value.gsub(" mi", "").to_f

  when "Skill Level"
    destination.skill_level = value
  when "Trailhead Elevation"
    destination.trailhead_elevation = value.gsub(" ft", "").gsub(",","").to_i
  when "Top Elevation"
    destination.top_elevation = value.gsub(" ft", "").gsub(",","").to_i
  when "Elevation Gain"
    destination.elevation_gain = value.gsub(" ft", "").gsub(",","").to_i
  else
  end
end

def construct_destinations
  base_url = "http://www.rei.com/"

  destinations = []
  files = Dir.entries(@folder).select {|f| !File.directory? f}
  # files = files[0,5] # TODO use for testing on small amount of files
  # files = ["strawhouse-trail.html","the-chimneys-trail.html"]

  construct_distances

  @houston_distances = {} if !@houston_distances
  @austin_distances = {} if !@austin_distances

  files.each do |file|
    filestring = File.open(@folder + file).read
    page = Nokogiri::HTML(File.open(@folder + file).read)

    lat_regex = /lat=-?(\d){,3}.(\d)*/
    lon_regex = /lng=-?(\d){,3}.(\d)*/

    table = page.css("table#spec_table")
    rows = table.css("tr")
    destination = Destination.new
    destination.link = base_url + page.xpath("//meta[@name='reiShortcut_requestUri']/@content")[0].value

    destination.name = page.css("h1").text

    rows.each do |row|
      section = row.css('th').text
      value = row.css('td').text
      parse_row(section, value, destination)
    end



    destination.houston_distance = @houston_distances[destination.name.downcase] ? @houston_distances[destination.name.downcase][0] : 999999999999
    destination.austin_distance = @austin_distances[destination.name.downcase] ? @austin_distances[destination.name.downcase][0] : 999999999999
    destination.houston_time = @houston_distances[destination.name.downcase] ? @houston_distances[destination.name.downcase][1] : "-"
    destination.austin_time = @austin_distances[destination.name.downcase] ? @austin_distances[destination.name.downcase][1] : "-"

    destination.lat = lat_regex.match(filestring)[0].gsub("lat=", "")
    destination.lon = lon_regex.match(filestring)[0].gsub("lng=","")

    if filter(destination) # TODO this filters some of them out!
      destinations << destination
    end
  end

  destinations
end

def output_html(destinations, name)
  destinations.sort!.reverse!
  filename = @base_folder + name
  contents = ""

  contents << "<head>
  <style>
  td {
      border-bottom-style:solid;
      border-bottom-width:1px;
      border-bottom-color: #333;
      padding-top: 5px;
      padding-bottom: 5px;
    }
  </style>
  </head>\n"
  contents << "<table>\n"
  contents << "<tbody>\n"
  contents << "<tr><td>Trail Name</td><td></td><td>Skill Level</td><td>City</td><td>Distance from Austin</td><td>Distance from Houston</td></tr>\n"
  destinations.each do |d|
    contents << "<tr>"
    contents << "<td><a href='#{d.link}'>#{d.name}</a>  </td><td>#{d.length} mi  </td><td>#{d.skill_level}  </td><td>#{d.city}  </td><td>#{d.austin_time}</td><td>#{d.houston_time}</td><td>#{d.gain} ft</td><td>#{d.lat}</td><td>#{d.lon}</td>"
    contents << "</tr>\n"
  end
  contents << "</tbody>\n"
  contents << "</table>\n"

  File.write(filename, contents)

end


# download_files # do this once
destinations = construct_destinations
# write_distance_csv destinations, "distances-test.csv" # do this once
# # write_city_distance_csv destinations, "distances-DELETE.csv"
output_html(destinations, "rei-distance.html")