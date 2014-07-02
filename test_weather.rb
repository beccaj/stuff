require_relative 'weather_utils'
require "date"

w = WeatherUtils.new
puts w.get_day_url(DateTime.now - 7)

start_date = DateTime.parse("20140607")
end_date = DateTime.now
# w.download_days_for_range(start_date, end_date)
puts w.get_temperature_at_time(DateTime.now-1)


