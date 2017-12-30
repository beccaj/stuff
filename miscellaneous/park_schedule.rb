require 'net/http'
require 'rubygems'
require 'nokogiri'     
require 'open-uri'
require 'date'
require 'mechanize'


# url = "http://texas.reserveworld.com/Login.aspx"

# page = agent.get(url)

# form = page.forms.first
# puts page

# form.name = "rebeccarosegoodwin@gmail.com"
# form.password = "sophiesky"

# username_field = form.field_with(id: "ctl00_ContentPlaceHolder1_txtLoginName")
# password_field = form.field_with(id: "ctl00_ContentPlaceHolder1_txtPassword")

# page = agent.submit(form)
# File.write("page.html", page.body)
agent = Mechanize.new

url = "http://texas.reserveworld.com/Home.aspx"
page = agent.get(url)
File.write("page.html", page.body)

park_id = "ctl00_ContentPlaceHolder1_lstParks"
month_id = "ctl00_ContentPlaceHolder1_DropDownFromMonth"
day_id = "ctl00_ContentPlaceHolder1_DropDownFromDay"
year_id = "ctl00_ContentPlaceHolder1_DropDownFromYear"

parks = ["colorado bend sp", "devils river sna", "hill country sna", "lost maples sna", "pedernales falls sp"]

form = page.forms.first

select = form.field_with(id: park_id)

hash = []
select.options.each_with_index {|x,i| hash << [x.text.downcase, i]}
hash = Hash[hash]

# hash = Hash[select.options.map {|x| [x.text.downcase, x]}]
options = select.options.map {|x| x.text.downcase}.sort

park_ids = []
parks.each {|park| park_ids << hash[park]}

month = Date.today.month
day = Date.today.day
year = Date.today.year

park_ids.each {|x| select.options[x].click}

puts "Submitting form"
page = agent.submit(form)
File.write("page.html", page.body)

