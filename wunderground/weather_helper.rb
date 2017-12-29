module WeatherHelper
	def get_data_for_year(airport, year)
		filepath = base_path + "#{airport}-#{year}.txt"

		file = File.open(filepath, "r")
		file_string = file.read

		data = CSV.parse(file_string, {:headers=> true})
	end
end