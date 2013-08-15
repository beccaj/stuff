require 'net/http'
require 'rubygems'
require 'nokogiri'     
require 'open-uri'
require 'date'

# url = "http://www.myfitnesspal.com/food/diary/arachne538?date=2013-07-14"
# uri = URI.parse(url)

# http = Net::HTTP.new(uri.host, uri.port)
# request = Net::HTTP::Get.new(uri.request_uri)
# request.basic_auth("arachne538", "sophiesky")
# response = http.request(request)

# puts response.body

BASE_FILEPATH = "/src/stuff/"
FOOD_FOLDER = "files-myfitnesspal/"
def download_files
	start_date = Date.today-240
	# start_date = Date.today - 3
	date = start_date
	while date < Date.today
		datestr = date.strftime('%Y-%m-%d')
		url = "http://www.myfitnesspal.com/food/diary/arachne538?date=#{datestr}"	
		page = nil
	  open(url) { |f| 
			page = f.read
		}

		filename = "#{FOOD_FOLDER}food-#{datestr}.html"
		puts "Writing #{filename}"
    File.write(filename, page)
    date = date + 1
  end
end

def download_measurements
	url = "http://www.myfitnesspal.com/measurements/edit?type=1"
	uri = URI.parse(url)

	http = Net::HTTP.new(uri.host, uri.port)
	request = Net::HTTP::Get.new(uri.request_uri)
	request.basic_auth("arachne538", "sophiesky")
	response = http.request(request)
	puts response.body
	end

def make_csv
	# url = "http://www.myfitnesspal.com/food/diary/arachne538"
	data = []
	orig_calories = []
	all_calories = []

	files = Dir.entries(FOOD_FOLDER).select {|f| !File.directory? f}

	files.each do |file|
		date = /\d\d\d\d-\d\d-\d\d/.match(file)[0]
		# url = "http://www.myfitnesspal.com/food/diary/arachne538?date=2013-07-25"
		page = Nokogiri::HTML(File.open("#{FOOD_FOLDER}#{file}"))
		if page != nil
			row = page.css('tr.total')[0]
			if row != nil
				cells = row.css('td')
				calories = cells[1].text.gsub(",","").to_i

				orig_calories << [date, calories] if calories > 1000 #and calories < 2200
			end
		end


	end

	orig_calories.sort! {|x,y| x[0] <=> y[0]}

	orig_calories.each_slice(14) do |slice|
		start_date = slice.first[0]
		end_date = slice.last[0]
		sum = slice.inject(0) {|sum, n| sum + n[1]}
		average = sum/slice.length

		puts "Average calories for #{start_date} - #{end_date}: #{average}"
		puts "\tmax calories: #{slice.max{|x,y| x[1] <=> y[1]}}"
		puts "\tmin calories: #{slice.min{|x,y| x[1] <=> y[1]}}"
	end


	# orig_calories.map {|c| puts "Total calories for #{c[0]}: #{c[1]}"}
end
	
# download_files	# do once
download_measurements
# make_csv