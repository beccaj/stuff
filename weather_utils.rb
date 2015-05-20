require 'date'
require 'csv'
require 'open-uri'
require 'net/http'
require 'chronic'
require 'rest-client' # doesn't throw weird header error
# CDT,Max TemperatureF,Mean TemperatureF,Min TemperatureF,Max Dew PointF,MeanDew PointF,Min DewpointF,Max Humidity, Mean Humidity, Min Humidity, Max Sea Level PressureIn, Mean Sea Level PressureIn, Min Sea Level PressureIn, Max VisibilityMiles, Mean VisibilityMiles, Min VisibilityMiles, Max Wind SpeedMPH, Mean Wind SpeedMPH, Max Gust SpeedMPH,PrecipitationIn, CloudCover, Events, WindDirDegrees
# CST, ... wtf sometimes cst
# http://www.wunderground.com/history/airport/katt/2014/7/2/DailyHistory.html
#
class WeatherUtils
	attr_accessor :airport, :filepath

	def initialize(airport = "KATT", filepath = "data")
		@airport = airport
		@directory = filepath
	end

	def get_temperature_at_time(date)
		# begin
			row = get_row_for_time(date)
			temp = row['TemperatureF']
		# rescue Exception => e
		# 	puts e
		# end
	end

	def get_humidity_at_time(date)
		row = get_row_for_time(date)
		row['Humidity']
	end

	def get_row_for_time(date)
		data = data_for_day(date)
		# strftime("%-I:%M %p")
		# time_regex = /(\d{1,2})/
		# meridian_regex = /[aApP][mM]/
		low_time = nil#Chronic.parse("#{date.strftime('%Y/%d/%m')} 12:01 AM")
		high_time = nil #low_time

		low_index = 0
		high_index = 0 # TODO bug for first row. Shouldn't be a problem since I don't do things at like 1 am

		data.each_with_index do |row, index|
			next if row.empty?
			timestring = "#{date.strftime('%Y/%m/%d')} "

			if row['TimeCDT']  # TODO should just fix this when downloading. Goddammit wunderground
				timestring << row['TimeCDT']
			elsif row['TimeCST']
				timestring << row['TimeCST']
			else
				raise "No time column for row #{row}!"
			end

			# puts "timestr in WeatherUtils : #{timestring}" # TODO
			time = Chronic.parse(timestring).to_datetime
			# puts "Date: #{date} Time: #{time}" # TODO
			if time > date
				# puts "#{time}: #{date}" # TODO
				high_time = time
				high_index = index
				break
			end

			low_time = time
			low_index = index
		end
		if !low_time
			best_row = data[high_index]
		elsif !high_time
			best_row = data[low_index]
		else
			# TODO check that it always gets the best time
			best_row = (low_time - date).abs < (high_time - date).abs ? data[low_index] : data[high_index]
		end
			raise "No row for date #{date} low_index: #{low_index} high_index: #{high_index}" if best_row.empty?
			best_row
	end

	def data_for_year(year)
		filename = filename_for_year(year)
		filestring = File.read("#{@directory}/#{filename}")
		CSV.parse(filestring, headers: true)
	end

# TimeCDT,TemperatureF,Dew PointF,Humidity,Sea Level PressureIn,VisibilityMPH,Wind Direction,Wind SpeedMPH,Gust SpeedMPH,PrecipitationIn,Events,Conditions,WindDirDegrees,DateUTC
	def data_for_day(date)
		begin
		filename = filename_for_day(date)
		filestring = File.read("#{@directory}/#{filename}")
		CSV.parse(filestring, headers: true)
	rescue Exception => e
		puts e
	end
	end



	def filename_for_day(date)
		"#{airport}-#{date.strftime("%Y%m%d")}.txt"
	end

	# def filename_for_day(year, month, day)
	# 	"#{airport}-#{year}#{month}#{day}.txt"
	# end

	def filename_for_year(date)
		year = date.respond_to?(:year) ? date.year : date
		"#{@airport}-#{year}.txt"
	end

	def get_day_url(date)
		"http://www.wunderground.com/history/airport/#{@airport}/#{date.year}/#{date.month}/#{date.day}/DailyHistory.html?format=1"
	end

	def get_year_url(date)
		start_year = date.respond_to?(:year) ? date.year : date
		start_month = 1
		start_day = 1

		end_year = start_year
		end_month = 12
		end_day = 31
		"http://www.wunderground.com/history/airport/#{@airport}/#{start_year}/#{start_month}/#{start_day}/CustomHistory.html?dayend=#{end_day}&monthend=#{end_month}&yearend=#{end_year}&req_city=NA&req_state=NA&req_statename=NA&format=1"
	end


	def download_days_for_range(start_date, end_date, force = false)
		while start_date <= end_date
			if force || !File.exist?(full_filepath(filename_for_day(start_date)))
				download_file_for_day(start_date)
				sleep 1
			end

			start_date += 1
		end
	end

	def download_file_for_day(date)
		url = get_day_url(date)
	  uri = URI.parse(url)
	  puts "URL: #{url}"
		# filestring = uri.read
		filestring = RestClient.get url
		filestring = filestring.gsub("<br />", "")

		filepath = full_filepath(filename_for_day(date))

		file = File.open(filepath, "w")
		file.puts filestring
		file.close

		puts "wrote file #{filepath}"
	end

	def download_file_for_year(year)
		url = get_year_url(year)
	  uri = URI.parse(url)
		filestring = Net::HTTP.get(uri)
		filestring = filestring.gsub("<br />", "")

		filepath = full_filepath(filename_for_year(year))

		file = File.open(filepath, "w")
		file.puts filestring
		file.close

		puts "wrote file #{filepath}"
	end



	def full_filepath(filename)
		"#{@directory}/#{filename}"
	end

end