require 'csv'
require_relative 'weather_utils'
require 'nokogiri'
require 'chronic'
require "rails"
# require 'datetime'

# Date	Type	Route Name	Distance (mi)	Duration	Average Pace	Average Speed (mph)	Calories Burned	Climb (ft)	Average Heart Rate (bpm)	Notes	GPX File

def format_date(date)
	date.strftime("%-m/%-d/%Y")
end

def pretty_date(date)
	date.strftime("%A, %-m/%-d/%Y").ljust(23)
end

@path = "/Users/rebeccag/stuff/runkeeper"
@filename = "cardioActivities.csv"
@bad_dates = ["2014/5/19"].map {|x| format_date(DateTime.parse(x)) }

@start_date = DateTime.parse("2013/12/16")
@end_date = DateTime.now #DateTime.parse("2014/6/17")

def round_to_half(n)
	(n*2.0).round/2.0
end

def format_round_to_half(n)
	x = round_to_half(n)
	sprintf("%g", x)
end

def get_data(filename = "#{@path}/#{@filename}")
	file = File.open(filename, "r")
	file_string = file.read	
	data = CSV.parse(file_string, {:headers=> true})	
end

def get_mondays(start_date, end_date)
	date = start_date
	dates = []

	while date <= end_date
		dates << date if date.monday?
		date += 1
	end

	dates
end

def parse_file(filename, debug=false)
	data = get_data(filename)
	date = DateTime.parse(data.first['Date'])
	total = 0
	week = date.cweek
	totals = {}
	(1..52).map {|x| totals[x] = {total: 0, longest: 0}}
	data.each do |row|
		date = DateTime.parse(row['Date'])

		if date.cweek != week
			puts "Total: #{total.round(2)}" if debug
			puts "\n\n" if debug
			total = 0
			week = date.cweek
		end

		if row['Type'] == "Running"
			distance = row['Distance (mi)'].to_f
			distance = 0 if @bad_dates.include?(format_date(date))
			total += distance
			datestring = date.strftime("%A, %m/%d/%Y")
			totals[date.cweek][:total] = totals[date.cweek][:total] + distance
			totals[date.cweek][:longest] = distance if distance > totals[date.cweek][:longest]
			puts "#{datestring}: #{distance} #{date.cweek}" if debug
		end
	end

	totals
end



def parse_file_by_day(filename, debug=false)
	data = get_data(filename)
	date = DateTime.parse(data.first['Date'])
	# total = 0
	# week = date.cweek
	# totals = {}
	days = {}
	# (1..52).map {|x| totals[x] = {total: 0, longest: 0}}
	data.each do |row|
		date = DateTime.parse(row['Date'])

		# if date.cweek != week
		# 	puts "Total: #{total.round(2)}" if debug
		# 	puts "\n\n" if debug
		# 	total = 0
		# 	week = date.cweek
		# end

		if row['Type'] == "Running"
			distance = row['Distance (mi)'].to_f
			distance = 0 if @bad_dates.include?(format_date(date))
			# total += distance
			datestring = format_date(date)#date.strftime("%A, %m/%d/%Y")
			# totals[date.cweek][:total] = totals[date.cweek][:total] + distance
			# totals[date.cweek][:longest] = distance if distance > totals[date.cweek][:longest]
			puts "#{datestring}: #{distance} #{date.cweek}" if debug
			days[datestring] ||= distance
		end
	end

	# totals
	days
end

def print_weekly
	dates = get_mondays(DateTime.parse("2013/12/10"), DateTime.parse("2014/6/17"))
	totals = parse_file("#{@path}/#{@filename}")

	dates.each do |date|
		puts "#{format_date(date).rjust(10)}: #{format_round_to_half(totals[date.cweek])}"
	end
end

def write_weekly(filename)
	dates = get_mondays(@start_date, @end_date)
	totals = parse_file("#{@path}/#{@filename}")

	filestring = ""
	dates.each do |date|
		week = totals[date.cweek]
		percent = week[:total] && week[:total] > 0 ? (week[:longest]/week[:total] * 100).round(1) : 0
		filestring << "#{format_date(date)},#{format_round_to_half(week[:total])},#{format_round_to_half(week[:longest])},#{percent}%\n"
	end
	puts filestring
	File.write(filename, filestring)
end

def write_by_week(filename)
	days = parse_file_by_day("#{@path}/#{@filename}", true)
	weeks = parse_file("#{@path}/#{@filename}")
	# puts days
	# puts weeks

	date = @start_date
	week = @start_date.cweek

	filestring = "Date,Week,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday,Total,Longest Percent\n"

	while(date <= @end_date)
		filestring << "#{format_date(date)},,"

		while(week == date.cweek)
			datestring = format_date(date)
			puts "#{pretty_date(date)}: #{days[datestring] ? format_round_to_half(days[datestring]) : 0} week #{date.cweek}"

			filestring << "#{days[datestring] ? format_round_to_half(days[datestring]) : ''},"

			date = date + 1
			# week = date.cweek
		end
			percent = weeks[week][:total] && weeks[week][:total] > 0 ? (weeks[week][:longest]/weeks[week][:total] * 100).round(1) : 0
			# filestring << "#{format_round_to_half(weeks[week][:total])},#{format_round_to_half(weeks[week][:longest])}\n"
			filestring << "#{format_round_to_half(weeks[week][:total])},#{percent}%\n"
			# puts format_round_to_half(weeks[week][:total])
			# puts "\n\n"
			# date = date + 1
			week = date.cweek		
	end

	puts filestring
	puts "Wrote file to #{filename}"
	File.write(filename, filestring)

end

def write_daily_weather(filename)
	puts "Writing weather file to #{filename}"
	data = get_data
	date = DateTime.parse(data.first['Date'])
	weather = WeatherUtils.new

	filestring = ""
	data.each do |row|
		next if row['Type'] != "Running"

		datestring = row['Date']
		time = Chronic.parse(datestring).to_datetime
		temperature = weather.get_temperature_at_time(time)
		ave_pace = row['Average Pace'].gsub(":", ".") # TODO
		# puts "#{pretty_date(time).rjust(25)}: #{time.strftime('%l:%M %p')} #{temperature} #{ave_pace}" if temperature.to_f > -99 && ave_pace.to_f < 15
		filestring << "#{format_date(time)},#{ave_pace},#{temperature}\n" if temperature.to_f > -99 && ave_pace.to_f < 15
	end
	File.open(filename, "w") do |f|
		f.write(filestring)
		f.close
	end	
end
# write_daily_weather("/Users/rebeccag/Desktop/run_weather.csv")
write_by_week("/Users/rebeccag/Desktop/run_detailed.csv")
# write_daily("/Users/rebeccag/Desktop/run_daily.csv")
# write_weekly("/Users/rebeccag/Desktop/run_totals.csv")

# print_weekly # I think 5/19 should be deleted.
# puts parse_file("#{@path}/#{@filename}")
# puts get_mondays(DateTime.parse("2013/12/1"), DateTime.parse("2014/6/17"))



