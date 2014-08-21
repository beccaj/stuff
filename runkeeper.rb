require 'csv'
require_relative 'weather_utils'
require_relative 'runkeeper_helper'
require 'nokogiri'
require 'chronic'
require "rails"
# require 'datetime'

# Date	Type	Route Name	Distance (mi)	Duration	Average Pace	Average Speed (mph)	Calories Burned	Climb (ft)	Average Heart Rate (bpm)	Notes	GPX File

include RunkeeperHelper

@path = "/Users/rebeccag/stuff/runkeeper"
@filename = "cardioActivities.csv"
@full_path = "#{@path}/#{@filename}"

@start_date = DateTime.parse("2013/12/16")
@end_date = DateTime.now #DateTime.parse("2014/6/17")


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

def parse_file(filename = "#{@path}/#{@filename}", debug=false)
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
			# distance = 0 if @bad_dates.include?(format_date(date))
			total += distance
			datestring = date.strftime("%A, %m/%d/%Y")
			totals[date.cweek][:total] = totals[date.cweek][:total] + distance
			totals[date.cweek][:longest] = distance if distance > totals[date.cweek][:longest]
			puts "#{datestring}: #{distance} #{date.cweek}" if debug
		end
	end

	totals
end



def parse_file_by_day(filename = "#{@path}/#{@filename}", debug=false)
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
			# distance = 0 if @bad_dates.include?(format_date(date))
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

def write_weekly(filename, debug = false)
	dates = get_mondays(@start_date, @end_date)
	totals = parse_file("#{@path}/#{@filename}")

	filestring = ""
	dates.each do |date|
		week = totals[date.cweek]
		percent = week[:total] && week[:total] > 0 ? (week[:longest]/week[:total] * 100).round(1) : 0
		filestring << "#{format_date(date)},#{format_round_to_half(week[:total])},#{format_round_to_half(week[:longest])},#{percent}%\n"
	end
	puts filestring if debug
	File.write(filename, filestring)
end

def write_by_week(filename, debug = false)
	days = parse_file_by_day("#{@path}/#{@filename}")
	weeks = parse_file("#{@path}/#{@filename}")

	date = @start_date
	week = @start_date.cweek

	last_weeks_total = 0.0
	total_days = 0.0
	total_weeks = 0.0
	total_miles = 0.0

	filestring = "Date,Week,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday,Total,% Total Increase,Longest,Longest Percent,Ave Weekly Total\n"

	while(date <= @end_date)
		filestring << "#{format_date(date)},,"

		while(week == date.cweek)
			datestring = format_date(date)
			miles = days[datestring] ? days[datestring].to_f : 0
			# puts "#{pretty_date(date)}: #{miles} week #{date.cweek}"

			filestring << "#{miles > 0 ? format_round_to_quarter(miles) : ''},"

			date = date + 1
			total_days += 1.0 if miles > 0
			total_miles += round_to_half(miles) # TODO use exact?
			# puts "Total days: #{total_days} Total miles: #{total_miles} ave: #{format_round_to_half(total_miles/total_days)}" if total_days > 0
			# week = date.cweek
		end
			this_weeks_total = weeks[week][:total].to_f
			total_weeks += 1.0
			percent_increase = last_weeks_total != 0 ? ((this_weeks_total - last_weeks_total)*100/last_weeks_total).round(1) : 100.0
			long_percent = weeks[week][:total] && weeks[week][:total] > 0 ? (weeks[week][:longest]/weeks[week][:total] * 100).round(1) : 0
			longest = format_round_to_half(weeks[week][:longest])
			ave_per_week = format_round_to_half(total_miles/total_weeks)
			# filestring << "#{format_round_to_half(weeks[week][:total])},#{format_round_to_half(weeks[week][:longest])}\n"
			

			filestring << "#{format_round_to_quarter(this_weeks_total)},#{percent_increase}%,#{longest},#{long_percent}%,#{ave_per_week}\n"
			last_weeks_total = weeks[week][:total].to_f

			# puts format_round_to_half(weeks[week][:total])
			# puts "\n\n"
			# date = date + 1
			week = date.cweek		
	end

	puts filestring if debug
	puts "Total miles: #{total_miles} Total Weeks: #{total_weeks}"
	puts "Wrote file to #{filename}"
	File.write(filename, filestring)

end

def write_daily_weather(filename, debug = false)
	puts "Writing weather file to #{filename}"
	data = get_data
	date = DateTime.parse(data.first['Date'])
	weather = WeatherUtils.new

	filestring = ""
	data.each do |row|
		next if row['Type'] != "Running"

		datestring = row['Date']
		time = Chronic.parse(datestring).to_datetime
		temperature = weather.get_temperature_at_time(time).to_f
		humidity = weather.get_humidity_at_time(time).to_f
		ave_pace = format_round_to_quarter(string_to_float(row['Average Pace']))
		# puts "#{pretty_date(time).rjust(25)}: #{time.strftime('%l:%M %p')} #{temperature} #{ave_pace}" if temperature.to_f > -99 && ave_pace.to_f < 15
		filestring << "#{format_date(time)},#{ave_pace},#{temperature},#{humidity},#{temperature + humidity}\n" if temperature.to_f > -99 && ave_pace.to_f < 16 && humidity > 0
	end
	puts filestring if debug

	File.open(filename, "w") do |f|
		f.write(filestring)
		f.close
	end	
end

def print_field_by_day(fieldnames, options = {}, filename = @full_path, debug = true)
	fields = fieldnames
	activity_types = options[:activity_types] || ["Running"] # Choices: Running, Hiking, and Walking
	start_date = options[:start_date] ? DateTime.parse(options[:start_date]) : @start_date
	end_date = options[:end_date] ? DateTime.parse(options[:end_date]) : @end_date
	days = options[:days] || ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]

	hash = {"Date" => []}
	fieldnames.each {|f| hash[f] = []}

	data = get_data
	num_rows = 0
	data.each do |row|
		date = DateTime.parse(row['Date'])
		if activity_types.include?(row['Type']) && date >= start_date && date <= end_date && is_desired_day?(date, days)
			s = format_date(date).rjust(10)
			hash["Date"] << date
			fieldnames.each { |field| hash[field] << string_to_float(row[field])}
			num_rows += 1
		end
	end
	num_rows -= 1


	(1..num_rows).each do |i|
		date = hash["Date"][i]
		s = "#{format_date(date)}"
		fields.each {|field| s << " #{hash[field][i].round(2)}"}
		puts s if debug
	end


	stat_hash = get_stats_for_hash(hash)

	fields.each do |key|
		field = stat_hash[key]

		puts "#{key}: ave: #{field[:ave].round(2)} median: #{field[:median].round(2)} low: #{field[:min].round(2)} high: #{field[:max].round(2)}" if debug
	end

end

weather = WeatherUtils.new
weather.download_days_for_range(@start_date, @end_date)

# print_field_by_day(["Duration", "Average Pace", "Calories Burned"], {
# 	activity_types: ["Walking"]
# 	# start_date: (DateTime.current-35).to_s,
# 	# days: ["Monday", "Tuesday", "wednesday", "thursday", "friday"]
# 	})
write_daily_weather("/Users/rebeccag/Desktop/run_weather.csv")
write_by_week("/Users/rebeccag/Desktop/run_detailed.csv")


