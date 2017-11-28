require 'net/http'
require 'httparty'
require 'nokogiri'
require 'rails'

def print_summary_to_file(url, file)
  html = HTTParty.get(url)
  doc = Nokogiri::HTML(html)

  table = doc.xpath("//table").first
  rows = table.xpath("//tr") # NOTE: this doesn't actually work, it gets all tr from the entire document

  file.puts(url)
  rows.each do |row|
    cells = row.children.map(&:text).map {|c| c.strip}.map {|c| c.gsub("\n", " ")}.select(&:present?)
    file.puts "- #{cells.join(" ")}"
  end
end

def print_hike_urls_to_file(list_url, file)
  html = HTTParty.get(list_url)
  doc = Nokogiri::HTML(html)
  paragraphs = doc.xpath("//p")

  paragraphs.each do |p|
    begin
      links = p.xpath("a")

      urls = links.map {|link| link.attributes["href"].value rescue nil}.compact.uniq
      blurb = p.text.strip.gsub("\n", "")

      urls.each {|url| file.puts url}
      file.puts blurb
      urls.each {|url| print_summary_to_file(url, file) }
      file.puts
    rescue Exception => e
      file.puts "Exception: #{e.message}"
      next
    end
  end
end

def write_hikes(list_url)
  filename = list_url.split("/").last.gsub(/\.html?/, ".txt")
  puts "Writing to #{filename}"

  File.open(filename, 'w') do |file| # open in 'a' to be in append mode instead of write
    print_hike_urls_to_file(list_url, file)
  end
end

def print_hikes(list_url)
  puts "Writing to stdout"
  print_hike_urls_to_file(list_url, $stdout)
end

def yellowstone_hike(link, file=$stdout)
  html = HTTParty.get(link)
  doc = Nokogiri::HTML(html)

  # cell = doc.xpath("//table/tbody/tr/td/table/tbody/tr/td").first
  # cell = cell.children[2]
  p = doc.xpath("//table/tr/td/table/tr/td").map {|c| c.text}.select {|x| x.include?("Wow Factor")}.first
  unless p
    file.puts "no details found for #{link}"
    return
  end

  file.puts link
  details = p.split("\n").map(&:strip).reject {|x| x == ""}
  details.each do |detail|
    file.puts detail
  end
end

def yellowstone_day_hikes(url, file=$stdout)

end

def yellowstone_hikes(url, file=$stdout) # TODO parse the day hikes page!
  html = HTTParty.get(url)
  doc = Nokogiri::HTML(html)
  links = doc.xpath("//a")
    .map {|a| a.attributes["href"].value rescue nil}
    .compact
    .select {|link| link =~ /yellowstone_hikes\//}
    .map {|link| link.gsub(/^(\.\.)/, "http://www.trailguidesyellowstone.com")}
    .uniq

  links.each do |link|
    yellowstone_hike(link, file)
    file.puts
  end
end

def write_yellowstone_hikes(url)
  filename = "yellowstone-hikes.txt"
  puts "Writing to #{filename}"
  File.open(filename, 'w') do |file|
    yellowstone_hikes(url, file)
  end

end

# write_hikes("http://www.tetonhikingtrails.com/grand-teton-best-easy-hikes.htm")
# write_hikes("http://www.rockymountainhikingtrails.com/rocky-mountain-top-10-hikes.htm")
# write_hikes("http://www.rockymountainhikingtrails.com/rocky-mountain-best-easy-hikes.htm")
# write_hikes("http://www.tetonhikingtrails.com/grand-teton-top-10-hikes.htm")

# yellowstone_hikes("http://www.trailguidesyellowstone.com/information/site_map.php")

# yellowstone_hike("http://www.trailguidesyellowstone.com/yellowstone_hikes/agate_creek_trail_yellowstone.php")
write_yellowstone_hikes("http://www.trailguidesyellowstone.com/information/site_map.php")
