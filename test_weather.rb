require_relative 'weather_utils'
require "date"
require "chronic"

w = WeatherUtils.new
# puts w.get_day_url(DateTime.now - 7)


start_date = DateTime.parse("20131201")
end_date = DateTime.parse("20131231")#DateTime.now
# w.download_days_for_range(start_date, end_date)

datestring = "2014-01-02T11:20:10"
date = Chronic.parse(datestring).to_datetime
# date = DateTime.parse("2013-12-20T13:34:12+00:00")
puts w.get_temperature_at_time(date)
puts date


