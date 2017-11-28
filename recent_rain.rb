require_relative "weather_utils"
require 'rails'
# 5/30 and 6/6
@weather = WeatherUtils.new

first_hike_date = Date.parse("2015/5/30")
second_hike_date = Date.parse("2015/6/6")
upcoming_hike_date = Date.parse("2015/12/5")


def weather_before(end_date)
  start_date = end_date - 2.weeks

  precipitation_for_period = (start_date..end_date).inject(0.0) do |total_sum, date|
    data = @weather.data_for_day(date)

    unless data.present?
      puts "No data for #{date}"
      next
    end

    total_precitation = data.inject(0.0) do |sum, row|
      precip_string =  row["PrecipitationIn"]
      precipitation = precip_string.to_f
      # puts "#{precip_string} #{precipitation}"
      sum + precipitation
    end
    result = total_sum + total_precitation
    puts "#{date}: #{total_precitation.round(2)} #{result.round(2)}"
    result
  end

end

def breaker
  puts (1..50).map{"*"}.join
end

puts "Weather before #{first_hike_date}"
weather_before(first_hike_date)
breaker

puts "Weather before #{second_hike_date}"
weather_before(second_hike_date)
breaker

puts "Weather before #{upcoming_hike_date}"
weather_before(upcoming_hike_date)
