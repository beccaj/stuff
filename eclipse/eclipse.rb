require 'httparty'
# require 'csv'
# require 'rails'
# require 'httparty'

class EclipseFileParser
  ECLIPSE_FILENAME = "eclipse2017.txt"

  ECLIPSE = File.read(ECLIPSE_FILENAME).lines.drop(7)

  def eclipse_coords # coordinates of the central line (I think...)
    ECLIPSE
      .map {|line| coords_from_eclipse_line(line) }
      .map {|north, south, central| central}
      .select {|lat,lng| !File.read("data/empty.txt").lines.map(&:strip)
      .include?("#{lat},#{lng}")}
      .compact
  end

  def parse_nasa_coords(s)
    match = s.match(/(?<degrees>\d+)\s(?<minutes>[\d\.]+)(?<direction>[NW])/)

    degrees = match["degrees"].to_f
    minutes = match["minutes"].to_f
    direction = match["direction"]

    decimal = minutes/60.0
    negator = ["s", "w"].include?(direction.downcase) ? -1 : 1

    (degrees + decimal) * negator
  end


  def coord_to_float(s)
    s = s.downcase
    if s =~ /[ws]/
      s = s.gsub(/[ws]/, "").to_f * -1
    else
      s = s.gsub(/[ne]/, "").to_f
    end
  end

  #                                                                       M:S                 Central
  # Universal  Northern Limit      Southern Limit       Central Line     Diam.  Sun Sun Path   Line
  #          ------------------  ------------------  ------------------  Ratio  Alt Azm Width Durat.
  #   Time   Latitude Longitude  Latitude Longitude  Latitude Longitude
  #           °   ´     °   ´      °   ´     °   ´      °   ´     °   ´            °   °   km
  def coords_from_eclipse_line(line)
    # line.split(/\s+/).select {|field| field =~ /[\d\.]+[WN]/i}.map {|field| coord_to_float(field)}.each_slice(2).to_a
    line
    .scan(/\d+\s\d+\.\d[WN]/)
    .each_slice(2)
    .to_a
    .map {|coord| [parse_nasa_coords(coord.first), parse_nasa_coords(coord.last)]}
  end

  # order is Northern Limit, Southern Limit, Central Line
  # eclipse_coords = ECLIPSE.map do |line|
  #   coords_from_eclipse_line(line)
  # end.select{|coord| coord.count == 3}
end

class DarkSky # TODO should move out into some other file

  DARKSKY_KEY = "e0e448b6b1589068df5090188f3444f1"

  # airport_filename =  "/Users/rebeccag/stuff/airports/airports.csv"
  # all_airports = CSV.read(airport_filename, headers: true)

  def filename_for_time(time:, latitude:, longitude:)
    "data/#{latitude}_#{longitude}_#{time}.json"
  end

  def weather_url(latitude:, longitude:, time:)
    "https://api.darksky.net/forecast/#{DARKSKY_KEY}/#{latitude},#{longitude},#{time}"
  end

  def empty_filename
    "data/empty.txt"
  end

  def empty_location?(latitude:, longitude:)
    File.read(empty_filename).lines.map(&:strip).include?("#{latitude},#{longitude}")
  end

  def record_empty_location(latitude:, longitude:)
    current_file = File.read(empty_filename)
    File.write(empty_filename, "#{current_file}\n#{latitude},#{longitude}")
  end

  def response_is_empty(json)
    json["currently"]["summary"].nil?
  end

  def download_file_for_time(time:, latitude:, longitude:, force: false)
    filename = filename_for_time(time: time, latitude: latitude, longitude: longitude)
    if force || !File.exist?(filename)
      if empty_location?(latitude: latitude, longitude: longitude)
        puts "#{latitude},#{longitude} has an empty weather summary"
      else
        url = weather_url(latitude: latitude, longitude: longitude, time: time)
        puts "Downloading #{url}"
        response = HTTParty.get(url)

        if response_is_empty(response)
          record_empty_location(latitude: latitude, longitude: longitude)
        else
          File.write(filename, response.to_json)
          puts "Writing #{filename}"
        end
      end
    else
      puts "Already downloaded #{filename}"
    end
  end

  def download_files
    month = 8
    # dates = (18..24).map {|day| (2006..2016).map {|year| {year: year, month: month, day: day}}}.flatten
    dates = (2006..2016).to_a.reverse.map {|year| (18..24).map {|day| {year: year, month: month, day: day}}}.flatten

    ECLIPSE.each do |line|
      dates.each do |date|
        begin
          # 44.638333333333335,-120.12 should have data :/
           # 17:22   45 06.6N 120 18.3W  44 10.0N 119 56.6W  44 38.3N 120 07.2W  1.027  42 121  102  02m05.0s
          time = line.split("\s+").first.match(/(?<hour>\d{2}):(?<minute>\d{2})/)
          next unless time

          hour, minute = time["hour"].to_i, time["minute"].to_i

          coords = EclipseFileParser.new.coords_from_eclipse_line(line)
          next unless coords

          south, north, central = coords
          lat, lng = central
          next unless lat && lng
          next if empty_location?(latitude: lat, longitude: lng)

          time = Time.new(date[:year], date[:month], date[:day], hour, minute, 0, "+00:00").to_i
          download_file_for_time(time: time, latitude: lat, longitude: lng)
        rescue => e
  puts "#{e.message}\n#{e.backtrace.join("\n")}"
        end
      end
    end
  end

  def data_for_line(line:, date:)
  # 2.1.5 :266 > json["currently"].keys
   # => ["time", "summary", "icon", "precipIntensity", "precipProbability", "temperature", "apparentTemperature", "dewPoint", "humidity", "windSpeed", "windBearing", "visibility", "cloudCover", "pressure"]

    json = JSON.parse(File.read(filename_for_time(time: time, latitude: lat, longitude: lng))) # JSON.parse(response.body)

    # Dir["data/*json"].map {|file| JSON.parse(File.read(file))["currently"]["cloudCover"]}
    # TODO next up...look at lat/lon and the cloud cover!
    currently = json["currently"]
    hourly = json["hourly"]["data"]

    currently["cloudCover"]
  end


end


# download_files

def display_weather
  weathers = EclipseFileParser.new.eclipse_coords.map do |latitude, longitude|
    filenames = Dir["data/#{latitude}_#{longitude}*json"]
    cloud_cover = filenames.map {|filename| JSON.parse(File.read(filename))["currently"]["cloudCover"]}.compact.map(&:to_f)
    next if cloud_cover.empty?

    average_cloud_cover = cloud_cover.inject(0.0) {|sum, x| sum + x}/cloud_cover.count
    # puts "Average cloud cover for #{latitude}, #{longitude}: #{average_cloud_cover}"
    {latitude: latitude, longitude: longitude, cloud_cover: average_cloud_cover}
  end.compact

  # weathers = weathers.sort_by {|weather| weather[:cloud_cover]}
  weathers.each do |weather|
    puts "Average cloud cover: #{(weather[:cloud_cover] * 100).round(2)} #{weather[:latitude]}, #{weather[:longitude]}}"
  end
  puts
  puts "Min: #{weathers.first[:cloud_cover]} #{weathers.first[:latitude].round(2)}, #{weathers.first[:longitude].round(2)}}"
  puts "Max: #{weathers.last[:cloud_cover]} #{weathers.last[:latitude].round(2)}, #{weathers.last[:longitude].round(2)}}"

end

def read_cloud_covers(force=false)
  @cloud_covers = nil if force

  @cloud_covers ||= EclipseFileParser.new.eclipse_coords.map do |latitude, longitude|
    filenames = Dir["data/#{latitude}_#{longitude}*json"]
    cloud_cover = filenames.map {|filename| JSON.parse(File.read(filename))["currently"]["cloudCover"]}.compact.map(&:to_f)
    next if cloud_cover.empty?

    average_cloud_cover = cloud_cover.inject(0.0) {|sum, x| sum + x}/cloud_cover.count
  end.compact # TODO think will be offset from my lat lon
end

def lat_lon_for_cloud_covers(force=false)
  @lat_lons = nil if force

  @lat_lons ||= EclipseFileParser.new.eclipse_coords.map do |latitude, longitude|
    filenames = Dir["data/#{latitude}_#{longitude}*json"]
    cloud_cover = filenames.map {|filename| JSON.parse(File.read(filename))["currently"]["cloudCover"]}.compact.map(&:to_f)
    next if cloud_cover.empty?
    [latitude, longitude]


  end.compact # TODO think will be offset from my lat lon
end


def get_colors
  min = read_cloud_covers.min
  max = read_cloud_covers.max

  read_cloud_covers.map do |average_cloud_cover|
    multiplier = (average_cloud_cover - min) / (max - min)
    puts "multiplier for #{average_cloud_cover}: #{multiplier}"

    red = 255.0 * multiplier
    green = 255.0 * multiplier
    blue = 255.0

    colors = [red, green, blue].map {|color| color.round.to_s(16).rjust(2, "0")}
    "##{colors.join}"
  end
end

# display_weather

inspect get_colors




# ------------------------------------------------------------------------------------------------
# end


# min_lat = eclipse_coords.map {|a,b,c| [a.first, b.first, c.first]}.flatten.min
# max_lat = eclipse_coords.map {|a,b,c| [a.first, b.first, c.first]}.flatten.max
# min_lon = eclipse_coords.map {|a,b,c| [a.last, b.last, c.last]}.flatten.min
# max_lon = eclipse_coords.map {|a,b,c| [a.last, b.last, c.last]}.flatten.max

# airports = all_airports.select do |airport|
#   lat, lon = airport["latitude_deg"].to_f, airport["longitude_deg"].to_f

#   # ["heliport", "small_airport", "closed", "seaplane_base", "balloonport", "medium_airport", "large_airport"]
#   ["large_airport", "medium_airport"].include?(airport["type"]) && # maybe include more
#   lat >= min_lat &&
#   lat <= max_lat &&
#   lon >= min_lon &&
#   lon <= max_lon
# end

# eclipse_coords.each do |north_coords, south_coords, mid_coords|
#   in_bounds = airports.select do |airport|
#     coord_to_float(airport["latitude_deg"]) >= south_coords[0] - 1 && # TODO how much wiggle factor?
#     coord_to_float(airport["latitude_deg"]) <= north_coords[0] + 1 &&
#     coord_to_float(airport["longitude_deg"]) >= south_coords[1] - 1 &&
#     coord_to_float(airport["longitude_deg"]) <= north_coords[1] + 1
#   # end.map {|a| "#{a["name"]} #{a["ident"]} #{a["iso_region"]}" }
#   end.map {|a| a["ident"] }
#   puts in_bounds
# end

