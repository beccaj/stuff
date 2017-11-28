require 'nokogiri'
require 'rails'
# "/Users/rebeccag/stuff/2014-02-08-new.gpx"

#TODO: 1) get rid of DOCTYPE, and <html><body> tags. 2) Now imports with way too much distance :/
# OK think those are mostly fixed. Distance still a little high

filename = ARGV.first
f = File.open(filename)
xml = Nokogiri::Slop(f)
f.close

min_threshold = 10
max_threshold = 600

segments = xml.html.body.gpx.trk.trkseg

last_lat, last_lon, last_ele, last_time, last_point = nil

to_fix = 0

all_points = []

segments.each do |segment|
  points = segment.trkpt

  all_points += points
  new_points = []

  points.each do |point|
    new_points << point

    lat = point.attributes["lat"].value.to_f
    lon = point.attributes["lon"].value.to_f

    ele = point.ele.text.to_f

    timestr = point.time.text
    time = DateTime.parse(timestr)

    diff = time && last_time ? time - last_time : 0
    diff *= 24*60*60.to_f.round(1)


    # puts "Point: #{last_point.time.text if last_point}"
    # puts "Lat: #{last_lat} Lon: #{last_lon}" if last_lat && last_lon
    if last_lat && last_lon
      if diff > max_threshold
        puts "Too big to fix: #{diff}"
      elsif diff > min_threshold
        dlat = lat - last_lat
        dlon = lon - last_lon    
        dele = ele - last_ele

        #TODO elevation

        # puts "Starting at #{last_time} with a diff of #{diff}"

        # # newpoints = int(ceil(float(diff)/min_threshold))
        num_newpoints = (diff/min_threshold).ceil.to_i

        num_newpoints.times do |i| # TODO I think this is right...
          frac = (i+1.0)/(num_newpoints + 1.0)
          new_lat = last_lat + dlat * frac
          new_lon = last_lon + dlon * frac
          new_ele = (last_ele + dele * frac).round(1)

          # puts "\tLat: #{new_lat} Lon: #{new_lon}"
          # new_time = last_time + (diff/num_newpoints)*(i+1)
          new_time = last_time + Rational(diff * frac, 24*60*60)
          # puts "\t\tLast time: #{last_time}"
          # puts "\t\tNew time: #{new_time}"

          # puts "\tadding time: #{new_time}"

# <trkpt lat="30.324429000" lon="-97.737555000"><ele>204.0</ele><time>2014-01-07T20:38:31Z</time></trkpt>
          new_point = Nokogiri::XML::Element.new("trkpt", xml)
          # new_point.attributes = {"lat" => new_lat, "lon" => new_lon}
          new_point["lat"] = "#{new_lat.round(6).to_s.ljust(12, "0")}"
          new_point["lon"] = "#{new_lon.round(6).to_s.ljust(13, "0")}"
          # puts "\tLat: #{new_point['lat']} Lon: #{new_point['lon']}"



          new_ele_node = Nokogiri::XML::Element.new("ele", xml)
          new_ele_node.content = new_ele

          new_time_node = Nokogiri::XML::Element.new("time", xml)
          new_time_node.content = new_time.strftime("%Y-%m-%dT%H:%M:%SZ")

          new_point.add_child(new_ele_node)
          new_point.add_child(new_time_node)

          # str = "<trkpt lat=\"#{new_lat}\" lon=\"#{new_lon}\"><ele>#{new_ele}</ele><time>#{new_time}</time></trkpt>"
          # puts "New point: #{new_point}"
          # new_points << new_point
          # puts "\tfrom #{last_point.time.text} => #{new_point.time.text}"

          last_point.add_next_sibling(new_point)
          last_point = new_point
          new_points << new_point


        end


        # puts "And finishing at #{time}\n\n"
        # puts "Fixing #{diff} #{dlat} #{dlon} #{num_newpoints} new points" if num_newpoints < 3

      else
      end


    end

    last_time = time
    last_lat = lat
    last_lon = lon
    last_ele = ele
    last_point = point


    # puts "From #{last_lat}, #{last_lon} to #{lat}, #{lon} in #{diff}" if diff > min_threshold
    to_fix += 1 if diff > min_threshold
  end

end

# puts "Total points: #{all_points.count} Bad points: #{to_fix}"
filestring = xml.to_xml

filestring.gsub!(/^<!DOCTYPE.*>$/, "")
filestring.gsub!(/<html><body>/, "")
filestring.gsub!(/<\/body><\/html>/, "")
filestring.gsub!(/^\n/, "")

puts filename
name = filename.split("/").last.split(".").first
out_file = "test-#{name}.gpx"
puts "Writing to #{out_file}"
File.write(out_file, filestring)
