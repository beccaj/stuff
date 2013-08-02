require 'net/http'
require 'rubygems'
require 'nokogiri'     
require 'open-uri'
require 'date'

class Destination
  attr_accessor :link, :name, :length, :city, :skill_level, :season, :trailhead_elevation, :top_elevation

  include Comparable
  def <=>(other)
    result = 0
    result = difficulty(other)
    result = self.length <=> other.length if result == 0 
    result
  end

  def difficulty(other)
    mydiff = nil
    otherdiff = nil
    # diffs = [["easy", 0], ["moderate to difficult", 2], ["moderate", 1], ["difficult", 3],["very strenuous", 5], ["strenuous", 4]]
    i= 0
    diffs = [["very easy", 0], ["easy to moderate", 2], ["easy",1],  ["moderate to difficult", 4], ["difficult to strenuous", 6], ["very strenuous", 9], ["moderately strenuous", 7], ["difficult to strenuous", 7], ["moderate", 3],["more challenging", 4], ["strenuous", 8], ["difficult", 5]]
    # puts diffs
    # difflist [[]]

    diffs.each do |diff| 
      mydiff = diff[1] if !mydiff and self.skill_level and self.skill_level.downcase.include? diff[0]
      otherdiff = diff[1] if !otherdiff and other.skill_level and other.skill_level.downcase.include? diff[0]
    end
    mydiff = -1 if !mydiff
    otherdiff = -1 if !otherdiff

    mydiff - otherdiff
  end
end

@folder = "/src/stuff/destinations/"

def parse_row(section, value, destination)
  case section
  when "Nearby City"
    destination.city = value
  when "Length"
    destination.length = value.gsub(" mi", "").to_f

  when "Skill Level"
    destination.skill_level = value
  when "Trailhead Elevation"
    destination.trailhead_elevation = value
  when "Top Elevation"
    destination.top_elevation = value
  else
  end
end

def download_files
  url = "http://www.rei.com/guidepost/list/texas/hiking/tx/7"
  page = Nokogiri::HTML(open(url))   
  list = page.css("ul.list-venue-name")
  items = list.css("li a")#[0,3]
  base_url = "http://www.rei.com/"
  destinations = []

  # items = [items[0]]
  # items.map {|i| puts "Link: #{i}"}

  items.each do |item|
    link = base_url + item['href']
    puts "url: #{link}"
    # page = Nokogiri::HTML(open(link))  
    page = open(link).read
    destination = item.text.downcase.gsub(/[()+ \/,:]/,"-")
    filename = @folder + destination + ".html"
    puts "Destination: #{filename}\n\n"
    File.write(filename, page)
  end
end


def construct_destinations
  base_url = "http://www.rei.com/"

  destinations = []
  files = Dir.entries(@folder).select {|f| !File.directory? f}
  files.each do |file|
    page = Nokogiri::HTML(File.open(@folder + file).read)
    # link = <meta name="reiShortcut_requestUri" content="/guidepost/detail/texas/hiking/3-mile-loop/27061">


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

    destinations << destination
  end

  destinations
end

def output_html(destinations)
  destinations.sort!.reverse!# {|x,y| y.length <=> x.length}
  puts "<head>
  <style>
  td {
      border-bottom-style:solid;
      border-bottom-width:1px;
      border-bottom-color: #333;
      padding-top: 5px;
      padding-bottom: 5px;
    }
  </style>
  </head>"
  puts "<table>"
  puts "<tbody>"
  destinations.each do |d|
    puts "<tr>"
    puts "<td><a href='#{d.link}'>#{d.name}</a>  </td><td>#{d.length} mi  </td><td>skill level: #{d.skill_level}  </td><td>city: #{d.city}  </td>"
    puts "</tr>"
  end
  puts "</tbody>"
  puts "</table>"
end


# download_files
destinations = construct_destinations
output_html(destinations)