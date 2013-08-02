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

def make_csv
	start_date = Date.today-180
	date = start_date
	# url = "http://www.myfitnesspal.com/food/diary/arachne538"
	data = []
	orig_calories = []
	all_calories = []

	while date < Date.today
		datestr = date.strftime('%Y-%m-%d')
		# puts "date: #{date}"
		url = "http://www.myfitnesspal.com/food/diary/arachne538?date=#{datestr}"
		# url = "http://www.myfitnesspal.com/food/diary/arachne538?date=2013-07-25"
		page = Nokogiri::HTML(open(url))   
		row = page.css('tr.total')[0]
		cells = row.css('td')
		calories = cells[1].text.gsub(",","").to_i
		# puts "Total calories for #{datestr}: #{calories}"
		# cells.map {|cell| puts "cell! #{cell.text}"}
		date = date + 1
		orig_calories << [date, calories]
	end

	orig_calories.map {|c| puts "Total calories for #{c[0]}: #{c[1]}"}
end
	
make_csv