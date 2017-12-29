require 'net/http'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'date'
require 'mechanize'
require 'csv'
require 'rails'
require_relative 'runkeeper_helper'
include RunkeeperHelper


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

@start_date = Date.new(2015,1,1)
@end_date = Date.yesterday
@calorie_goal = 1700

def myfitnesspal_link(date)
	datestr = date.strftime('%Y-%m-%d')
	"http://www.myfitnesspal.com/food/diary/arachne538?date=#{datestr}"
end
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

		url = myfitnesspal_link(date)
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

def print_averages_old
	csv = CSV.parse(File.read("calories.csv"), headers: true)
	orig_calories = []
	csv.each do |line|
		date = line["Date"]
		calories = line["Calories"].to_f
		orig_calories << [date, calories] if valid_calorie_amount(calories) # > 1000 #and calories < 2200
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

end

def make_food_csv
	# url = "http://www.myfitnesspal.com/food/diary/arachne538"
	data = []
	orig_calories = []
	all_calories = []

	files = Dir.entries(FOOD_FOLDER).select {|f| !File.directory? f}.sort

	csv = CSV.generate do |line|
		line << [
			"Date",
			"Calories",
			"Carbs",
			"Fat",
			"Protein",
			"Carbs %",
			"Fat %",
			"Protein %",
			"Link"
		]

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
					carbs = cells[2].text.gsub(",","").to_i
					fat = cells[3].text.gsub(",","").to_i
					protein = cells[4].text.gsub(",","").to_i

					carb_percent = 0
					fat_percent = 0
					protein_percent = 0


					if valid_calorie_amount calories # && calories > 0
						macro_calories = carbs*4.0 + fat*9.0 + protein*4.0 # make them add to 100%
						carb_percent = (carbs*4.0*100/macro_calories.to_f).round
						fat_percent = (fat*9.0*100/macro_calories.to_f).round
						protein_percent = (protein*4.0*100/macro_calories.to_f).round
					end

					# the percents don't add for a lot of days.
					# Uncomment this and change macro_calories to calories ^ to look into it.
					# total_percent = carb_percent + fat_percent + protein_percent
					# puts "#{date}: #{total_percent}" if total_percent < 95 && total_percent > 0

					line << [
						date,
						calories,
						carbs,
						fat,
						protein,
						carb_percent,
						fat_percent,
						protein_percent,
						myfitnesspal_link(Date.parse(date))
					]

				end
			end
		end
	end



	puts "Writing calories.csv"
	File.write("calories.csv", csv)

	# orig_calories.map {|c| puts "Total calories for #{c[0]}: #{c[1]}"}
end

def write_weekly_csv
	filename = "weekly_calories.csv"
	data = date_hash CSV.parse(File.read("calories.csv"), {:headers=> true})
  fields = data["headers"]

	csv = CSV.generate do |line|
		line << ["Date"].concat(fields)
    ave = MovingAverage.new(7)
    ave_hash = {}
    current_ave = MovingAverage.new(7)

		get_mondays(@start_date, @end_date).each do |monday|
	    fields.each {|f| ave_hash[f] = MovingAverage.new(7)}

			(monday..(monday+6)).each do |date|
				row = data[date.strftime("%Y-%m-%d")]
				if row
					next unless valid_calorie_amount(row['Calories'].to_f)
          fields.each {|f| ave_hash[f].add(row[f].to_f) if row[f].to_f > 0}
          current_ave.add(row['Calories'].to_f) if valid_calorie_amount(row['Calories'].to_f) # row['Calories'].to_f > 0
				end
			end

			line << [format_date(monday)].concat(fields.map do |f|
				ave_hash[f].average.round
			end)
			if monday.beginning_of_day == Date.current.beginning_of_week.beginning_of_day
				this_week_ave = ave_hash['Calories'].average.round
				last_seven_days = current_ave.average.round
				days_into_week = ave_hash['Calories'].length

				puts "Calorie goal: #{@calorie_goal}"
				puts "Current week: #{this_week_ave}"
				puts "Total calories over for this week: #{(this_week_ave - @calorie_goal) * days_into_week}"
				puts "Last 7 days: #{last_seven_days}"
				puts "Total calories over for last 7 days: #{(last_seven_days - @calorie_goal) * 7}"
			end

		end
	end
	puts "Writing #{filename}"
	File.write(filename, csv)
end

def valid_calorie_amount(calories)
	calories && calories.to_f > 1100
end

download_files
# download_measurements # do once
make_food_csv
write_weekly_csv

# print_averages_old



