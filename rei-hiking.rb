require 'net/http'
require 'rubygems'
require 'nokogiri'     
require 'open-uri'
require 'date'
require 'json'
require 'set'
require 'csv'

class Destination
  attr_accessor :link, :name, :length, :city, :skill_level, :season, :trailhead_elevation, :top_elevation
  @austin_distances = {}
  @houston_distances = {}

  include Comparable
  def <=>(other)
    result = 0
    result = compare_city(other)
    result = difficulty(other) if result == 0
    result = self.length <=> other.length if result == 0 
    result
  end

  def compare_city(other)

    # puts data["routes"][0]["legs"][0]["duration"]["value"]
    # puts data["routes"][0]["legs"][0]["duration"]["text"]






    # response = Net::HTTP.get_response(URI.parse(url)).body
    # data = JSON.parse(response)
    # puts data["routes"][0]["legs"][0]["duration"]["value"]
    # puts data["routes"][0]["legs"][0]["duration"]["text"]













    # cities = {"austin"=> 0, "houston" => 1, "missouri city" => 2, "san antonio" => 3, "galveston" => 4, "corpus christi" => 5}

    # mydiff = cities[self.city.downcase] ? cities[self.city.downcase] : 10 #+ self.city.downcase.hash
    # otherdiff = cities[other.city.downcase] ? cities[other.city.downcase] : 10 #+ other.city.downcase.hash.abs
    # if mydiff == 10 and otherdiff == 10
    #   return self.city <=> other.city
    # end

    # otherdiff - mydiff
    0
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
@base_folder = "/src/stuff/"



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
          invalid.add destination.gsub("%20", " ")
        end
        line
end

def write_distance_csv(dests)
  @austin_distances = {} 
  @houston_distances = {}
  invalid = Set.new

  origin = "austin"
  filename = @base_folder + "distances.csv"
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

  # @austin_distances.keys.map {|key| puts "Austin: #{key}: #{@austin_distances[key]}"}
  # @austin_distances.keys.map {|key| puts "Houston: #{key}: #{@houston_distances[key]}"}
  puts "INVALID CITIES:"
  invalid.map {|i| puts i}

end

def construct_destinations
  base_url = "http://www.rei.com/"

  destinations = []
  files = Dir.entries(@folder).select {|f| !File.directory? f}
  # files = files[0,20] #TODO
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
  filename = @base_folder + "rei-distance.html"
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
  </head>"
  contents << "<table>"
  contents << "<tbody>"
  destinations.each do |d|
    contents << "<tr>"
    contents << "<td><a href='#{d.link}'>#{d.name}</a>  </td><td>#{d.length} mi  </td><td>skill level: #{d.skill_level}  </td><td>city: #{d.city}  </td>"
    contents << "</tr>"
  end
  contents << "</tbody>"
  contents << "</table>"

  File.write(filename, contents)

end


# download_files
destinations = construct_destinations
write_distance_csv destinations
output_html(destinations)