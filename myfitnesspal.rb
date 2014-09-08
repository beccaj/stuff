require 'net/http'
require 'rubygems'
require 'nokogiri'     
require 'open-uri'
require 'date'
require 'mechanize'

# url = "http://www.myfitnesspal.com/food/diary/arachne538?date=2013-07-14"
# uri = URI.parse(url)

# http = Net::HTTP.new(uri.host, uri.port)
# request = Net::HTTP::Get.new(uri.request_uri)
# request.basic_auth("arachne538", "sophiesky")
# response = http.request(request)

# puts response.body

BASE_FILEPATH = "/Users/rebeccag/stuff/"
FOOD_FOLDER = "files-myfitnesspal/"
MEASUREMENT_FOLDER = "measurements/"
def download_files
	start_date = Date.today-30
	end_date = Date.today-1 # might not be done for today
	# start_date = Date.today - 3
	date = start_date
	# while date < Date.today
	(start_date..end_date).each do |date|
		datestr = date.strftime('%Y-%m-%d')
		filename = "#{FOOD_FOLDER}food-#{datestr}.html"

		next if File.exist?(filename)	

		url = "http://www.myfitnesspal.com/food/diary/arachne538?date=#{datestr}"	
		page = nil
		puts "Opening url #{url}"
	  open(url) { |f| 
			page = f.read
		}

		puts "Writing #{filename}"
    File.write(filename, page)
    date = date + 1 
  end
end

def download_measurements
	url = "http://www.myfitnesspal.com/measurements/edit?type=1"

	# uri = URI.parse(url)

	# http = Net::HTTP.new(uri.host, uri.port)
	# request = Net::HTTP::Get.new(uri.request_uri)
	# request.basic_auth("arachne538", "sophiesky")
	# response = http.request(request)
	# puts response.body

	# url = "http://www.google.com"
	agent = Mechanize.new

	(1..5).each do |i| # TODO will eventually have > 5 pages, should change this to a while loop
		url = "http://www.myfitnesspal.com/measurements/edit?page=#{i}&type=1"		
		url = "http://www.myfitnesspal.com/measurements/edit?type=1" if i == 1

		page = agent.get(url)
		# pp page
		if i == 1
			form = page.forms[2]
			pp form
			form.username = "arachne538"
			form.password = "sophiesky"

			page = agent.submit(form)			
		end


		# pp page
		# puts page.body
		filename = "#{BASE_FILEPATH}#{MEASUREMENT_FOLDER}measurements-#{i}"
		puts "writing #{filename}"
		File.write(filename, page.body)
	end
end

def make_measurement_csv
end


def make_food_csv
	# url = "http://www.myfitnesspal.com/food/diary/arachne538"
	data = []
	orig_calories = []
	all_calories = [] 

	files = Dir.entries(FOOD_FOLDER).select {|f| !File.directory? f}

	files.each do |file|
		next unless /\d\d\d\d-\d\d-\d\d/.match(file)
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

	sum = orig_calories.inject(0) {|sum, n| sum + n[1]}
	average = sum/orig_calories.length

	puts "\n** Average calories of entire period: #{average}"
	puts "\tmax calories: #{orig_calories.max{|x,y| x[1] <=> y[1]}}"
	puts "\tmin calories: #{orig_calories.min{|x,y| x[1] <=> y[1]}}"		



	# orig_calories.map {|c| puts "Total calories for #{c[0]}: #{c[1]}"}
end
	
download_files	# do once
# download_measurements # do once
make_food_csv