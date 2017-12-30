require 'open-uri'
require 'csv'


module STUFF
	def sayhello
		puts "HEllo!"
	end
end

#@base_path = "/src/stuff/data/"
@base_path = "/Users/rebeccag/stuff/data/"



@url_start = "http://www.wunderground.com/history/airport/"
@airport = "KATT" # "KATT/"  # "ENBR/"
@url_end = "/MonthlyHistory.html?format=1"

def get_year_url(airport, year)
	start_year = year
	start_month = 1
	start_day = 1

	end_year = year
	end_month = 12
	end_day = 31
	"http://www.wunderground.com/history/airport/#{airport}/#{start_year}/#{start_month}/#{start_day}/CustomHistory.html?dayend=#{end_day}&monthend=#{end_month}&yearend=#{end_year}&req_city=NA&req_state=NA&req_statename=NA&format=1"
end

def get_yearly(airport, start_year, end_year)
	current = start_year

	while current <= end_year
		url = get_year_url(airport, current)

		file_string = ""
		#puts "About to open file"
		open (url) do |f|
			file_string = f.read
		end

		file_string = file_string.gsub("<br />", "")
		# puts "file_string: #{file_string}"


		filepath = @base_path + airport + "-" + current.to_s + ".txt"

		file = File.open(filepath, "w")
		file.puts file_string
		file.close

		puts "wrote file #{filepath}"

		current = current + 1
	end
end

def get_monthly
	start_date = 1948
	end_date = 2012

	current = start_date

	while current <= end_date
		month = 1

		while month <= 12

			date = "#{current}/#{month}/13"
			date_string = date.split("/").join("-")

			url = @url_start + @airport + date + @url_end

			file_string = ""
			#puts "About to open file"
			open (url) do |f|
				file_string = f.read
			end

			file_string = file_string.gsub("<br />", "")
			# puts "file_string: #{file_string}"


			filepath = @base_path + @airport.gsub("/", "-") + date_string + ".txt"

			file = File.open(filepath, "w")
			file.puts file_string
			file.close

			puts "wrote file #{filepath}"

			month = month + 1
		end

		current = current + 1

	end	
end

def get_daily(month)
	url_end = "DailyHistory.html?format=1"

end

puts "Running!"
# get_yearly(@airport, 1948, 2013)


