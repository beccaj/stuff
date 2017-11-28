# https://darksky.net/dev/docs/time-machine

require './eclipse.rb'
require 'rails' # For DateTime#to_i, if anyone was wondering

def parse_coords(s)
  match = s.match(/(?<degrees>[\d\.]+)[^\d\.]+(?<minutes>[\d\.]+)?[^\d\.]*(?<seconds>[\d\.]+)?[^\d\.]*(?<direction>[NSEW])/)

  degrees = match["degrees"].to_f
  minutes = match["minutes"].to_f || 0
  seconds = match["minutes"].to_f || 0
  direction = match["direction"]

  decimal = minutes/60.0 + seconds/60/60.0 # TODO not sure about the seconds
  negator = ["s", "w"].include?(direction.downcase) ? -1 : 1

  (degrees + decimal) * negator
end


def weather_url(latitude:, longitude:, time:)
  "https://api.darksky.net/forecast/#{DARKSKY_KEY}/#{latitude},#{longitude},#{time}"
end

# east: 42.712133, -111.042568
# west: 42.641207, -104.052944

# shoshoni: 43.2389701,-108.1583204

coords = EclipseFileParser.new.eclipse_coords
coords.select {|lat, lon| lon >= -112 && lon <= -104}


def campsites
  glacier_basin = "40°19′48″N 105°35′40″W"

  bridge_bay = "44.5345° N, 110.4370° W"
  latitude, longitude = bridge_bay.split(", ").map {|x| parse_coords(x).round(2)}

  time = DateTime.parse("2016/08/25 03:00:00 MDT").to_i
  result = HTTParty.get(weather_url(latitude: latitude, longitude: longitude, time: time.to_i))

  puts result["hourly"]["data"].map {|data| "#{Time.at(data["time"])}: #{data["temperature"]}"}.join("\n")
end


def download_shoshoni_past_weather!
  weather = DarkSky.new
  shoshoni_coords = [43.2389701,-108.1583204]

  years = (2011..2016)
  years.each do |year|
    days = (16..26)

    days.each do |day|
      time = DateTime.parse("#{year}/08/#{day} 11:40:00 MDT").to_i
      # url = weather.weather_url(latitude: shoshoni_coords[0], longitude: shoshoni_coords[1], time: time)
      weather.download_file_for_time(latitude: shoshoni_coords[0], longitude: shoshoni_coords[1], time: time)
    end
  end
end

filenames = `ls data/43.2389701_-108.1583204_*`.split("\n")
filenames.each do |filename|
  json = JSON.parse(File.read(filename))
  puts "Cloud cover: #{json["currently"]["cloudCover"]}"
end

# download_shoshoni_past_weather!






