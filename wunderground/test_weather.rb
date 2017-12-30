require_relative 'weather_utils'
require "date"
require "chronic"
require 'rails'
w = WeatherUtils.new
# puts w.get_day_url(DateTime.now - 7)


start_date = DateTime.parse("20131201")
end_date = DateTime.parse("20131231")#DateTime.now
# w.download_days_for_range(start_date, end_date)

datestring = "2014-01-02T11:20:10"
date = Chronic.parse(datestring).to_datetime
# date = DateTime.parse("2013-12-20T13:34:12+00:00")
# puts w.get_temperature_at_time(date)
# puts date

(1.month.ago.to_date..Date.yesterday).each do |date|
  puts "\n\n#{date.strftime('%-m/%-d/%Y')}"
  times = (0..23).map {|h| date.to_datetime + h.hours}
  pressures = times.map {|x| [x, w.get_row_for_time(x)["Sea Level PressureIn"]]}

  pressures.each_with_index do |record, i|
    index = i >= 3 ? i - 3 : 0
    last_record = pressures[index]
    last_time = last_record.first.strftime('%H:%M')
    this_time = record.first.strftime('%H:%M')
    last_val = last_record.last.to_f
    this_val = record.last.to_f


    if (this_val - last_val).abs > 0.06
      puts "#{this_time} - #{last_time}: #{this_val}-#{last_val}: #{(this_val - last_val).round(2)}"
    end
  end
end


