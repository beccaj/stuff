require 'csv'
@base_path = "/Users/rebeccag/stuff/data/"

# CST,Max TemperatureF,Mean TemperatureF,Min TemperatureF,Max Dew PointF,MeanDew PointF,Min DewpointF,Max Humidity, Mean Humidity, Min Humidity, Max Sea Level PressureIn, Mean Sea Level PressureIn, Min Sea Level PressureIn, Max VisibilityMiles, Mean VisibilityMiles, Min VisibilityMiles, Max Wind SpeedMPH, Mean Wind SpeedMPH, Max Gust SpeedMPH,PrecipitationIn, CloudCover, Events, WindDirDegrees
def get_data_for_year(airport, year)
	filepath = @base_path + "#{airport}-#{year}.txt"

	file = File.open(filepath, "r")
	file_string = file.read

	data = CSV.parse(file_string, {:headers=> true})
	file.close
	data
end

def within_range(date, start_date, end_date)
	start_date = DateTime.parse(start_date)
	end_date = DateTime.parse(end_date)
	date = DateTime.parse(date)

	date >= start_date && date <= end_date	
end

def get_plus_string(temp, warm, hot)
	str=""
	cold_diff = [temp - warm, hot-warm].min
	hot_diff = temp - hot

	cold_diff.times do |c|
		str << "-"
	end

	hot_diff.times do |h|
		str << "+"
	end

	str
end

def get_min_hash
	year = 2013

	start_year = 2008
	end_year = 2013

	@base_path = "/Users/rebeccag/stuff/data/"
	@airport = "KATT"

	year = start_year
	hash = {}

	while year < end_year
		data = get_data_for_year(@airport, year)
		if data && data.length > 1 && data[1]['CST'] 
			data.each_with_index do |line, i|
				next if i == 0

				date = data[i]['CST']
				date_hash = date.gsub(/\d\d\d\d-/,"")

				min = data[i]['Min TemperatureF'].to_i

				if within_range(date, "#{year}-04-1", "#{year}-10-1")
					hash[date_hash] = hash[date_hash] ? hash[date_hash] << min : [min]
				end
			end

		end

	
		year = year + 1
	end

	hash
end

def print_pluses
	hash = get_min_hash

	sorted_hash = hash.sort do |x,y|
		comp = x[0].split("-")[0].to_i <=> y[0].split("-")[0].to_i
		comp.zero? ? x[0].split("-")[1].to_i <=> y[0].split("-")[1].to_i : comp
	end
	sorted_hash.each do |x|
		date = x[0]
		list = x[1].sort
		sum = list.inject(0.0) {|sum, x| sum + x}.to_f
		mean = (sum/list.length.to_f).to_i

		median = list[list.size/2]

		pluses = get_plus_string(median, 60, 70)
		puts "#{date.ljust(6)} #{list} (#{median}): #{pluses}"
	end
end

print_pluses

