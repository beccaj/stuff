require 'csv'
require_relative '../weather_utils'
require_relative 'runkeeper_helper'
require_relative 'runkeeper_chart'

require 'nokogiri'
require 'chronic'
require "rails"

require 'net/http'
require 'open-uri'
require 'mechanize'

require 'zip'

# require 'datetime'

# Date  Type  Route Name  Distance (mi) Duration  Average Pace  Average Speed (mph) Calories Burned Climb (ft)  Average Heart Rate (bpm)  Notes GPX File

include RunkeeperHelper

@path = "/Users/rebeccag/stuff/runkeeper"
@filename = "cardioActivities.csv"
@full_path = "#{@path}/#{@filename}"

@start_date = DateTime.parse("2013/12/16")
@end_date = DateTime.now #DateTime.parse("2014/6/17")
@activity_url = "http://runkeeper.com/user/1249271122/activitylist"

def login_runkeeper(url="https://runkeeper.com/exportDataForm", agent)
  page = agent.get(url)

  form = page.form_with(name: "lightBoxLogInForm")
  unless form
    puts "It appears we're already logged in..."
    return page # assume that we're already logged in...
  end

  form.name = "rebeccarosegoodwin@gmail.com"
  form.password = "sophiesky"

  # password_field = form.field_with(id: "passwordInput")
  # username_field = form.field_with(id: "emailInput")

  password_field = form.field_with(name: "password")
  username_field = form.field_with(name: "email")
  username_field.value = "rebeccarosegoodwin@gmail.com"
  password_field.value = "sophiesky"

  page = agent.submit(form)
end

def activity_page
  url = "http://runkeeper.com/user/1249271122/activitylist"
  agent = Mechanize.new
  page = login_runkeeper(url, agent)

  File.write("ACTIVITY.html", page)

end

def refresh_files(force=false)
  agent = Mechanize.new
  filename = "runkeeper-#{DateTime.current.strftime('%Y%m%d')}.zip"
  puts "Refreshing runkeeper files..."

  if File.exist?(filename) && !force
    puts "Already refreshed runkeeper files for today"
    return
  end

  page = login_runkeeper(agent)

  link = page.link_with(text: "Download Now!")
  tries = 1

  while !link && tries < 5 # TODO test tomorrow
    form = page.form_with(name: "dataExportForm")
    start_field = form.field_with(id: "startDate")
    end_field = form.field_with(id: "endDate")
    start_field.value = @start_date.strftime("%-m/%-d/%Y")
    end_field.value = @end_date.strftime("%-m/%-d/%Y")

    page = agent.submit(form)
    puts "Waiting 3 min at #{DateTime.current.strftime("%H:%M:%S")} after submitting form (try #{tries})"
    sleep(60*3) # wait 3 minutes

    page = login_runkeeper(agent)
    link = page.link_with(text: "Download Now!")
    tries += 1
  end

  if link
    uri = URI.parse(link.href)

    open(filename, 'wb') do |fo|
      fo.print open(uri).read
    end

    puts "Saving zip file: #{filename}"
    unzip_runkeeper(filename)
  else
    puts "Problem getting page"
  end

end

def unzip_runkeeper(filename, force=false)
  File.delete("#{@path}/cardioActivities.csv") if File.exist?("#{@path}/cardioActivities.csv")

  if force
    Dir.foreach("#{@path}/") {|f| fn = File.join(@path, f); File.delete(fn) if f != '.' && f != '..'}
  end

  dest_file = "#{@path}"
  Zip::File.open(filename) do |zip_file|
  # Handle entries one by one
    zip_file.each do |entry|
      # Extract to file/directory/symlink
      next if File.exist?("#{@path}/#{entry.name}")

      begin
        entry.extract("#{@path}/#{entry.name}")
        puts "Extracted #{entry.name}"
      rescue Exception => e
        puts "Exception: #{e}"
      end

      # Read into memory
      # content = entry.get_input_stream.read
    end
  end
end

def get_data(filename = "#{@path}/#{@filename}")
  file = File.open(filename, "r")
  file_string = file.read
  data = CSV.parse(file_string, {:headers=> true})
end



def parse_file(filename = "#{@path}/#{@filename}", debug=false)
  data = get_data(filename)
  date = DateTime.parse(data.first['Date'])
  total = 0
  week = format_date(date.beginning_of_week) #date.cweek
  totals = {}

  # TODO will this work once I've been running more than a year? NO.
  # (1..52).map {|x| totals[x] = {total: 0, longest: 0}}
  data.each do |row|
    date = DateTime.parse(row['Date'])
    datestring = format_date(date)

    if format_date(date.beginning_of_week) != week
      puts "Total: #{total.round(2)}" if debug
      puts "\n\n" if debug
      total = 0
      week = format_date(date.beginning_of_week) #date.cweek
    end

    if row['Type'] == "Running"
      distance = row['Distance (mi)'].to_f
      # distance = 0 if @bad_dates.include?(format_date(date))
      total += distance
      datestring = date.strftime("%A, %m/%d/%Y")
      totals[week] ||= {total: 0, longest: 0}
      totals[week][:total] += distance #= totals[datestring][:total] + distance
      totals[week][:longest] = distance if distance > totals[week][:longest]
      puts "#{datestring}: #{distance} week: #{week}" if debug
    end
  end

  puts "totals for parse_file:\n#{totals}" if debug
  totals
end



def parse_file_by_day(filename = "#{@path}/#{@filename}", debug=false)
  data = get_data(filename)
  date = DateTime.parse(data.first['Date'])

  days = {}

  data.each do |row|
    date = DateTime.parse(row['Date'])

    if row['Type'] == "Running"
      distance = row['Distance (mi)'].to_f
      datestring = format_date(date)
      puts "#{datestring}: #{distance}" if debug
      days[datestring] ||= distance
    end
  end

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
    datestring = format_date(date)
    week = totals[datestring]
    percent = week[:total] && week[:total] > 0 ? (week[:longest]/week[:total] * 100).round(1) : 0
    filestring << "#{format_date(date)},#{format_round_to_half(week[:total])},#{format_round_to_half(week[:longest])},#{percent}%\n"
  end
  puts filestring if debug
  File.write(filename, filestring)
end

def write_by_week(filename, debug = false)
  days = parse_file_by_day("#{@path}/#{@filename}")
  weeks = parse_file("#{@path}/#{@filename}", debug)

  date = @start_date
  week = format_date(date.beginning_of_week) #@start_date.cweek

  num_weeks_for_ave = 4

  last_weeks_total = 0.0
  total_days = 0.0
  total_weeks = 0.0
  total_miles = 0.0

  moving_ave = MovingAverage.new(num_weeks_for_ave)
  filestring = CSV.generate do |csv|
    csv << [
      "Date",
      "Week",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
      "Total",
      "% Total Increase",
      "Longest",
      "Longest Percent",
      "Last #{num_weeks_for_ave} weeks Total",
      "Ave Weekly Total"
    ]

    week_hash = days_of_week.inject({}) {|hash, day| hash[day.downcase.to_sym] = nil; hash}

    while(date <= @end_date)
      while(week == format_date(date.beginning_of_week))
        datestring = format_date(date)
        miles = days[datestring] ? days[datestring].to_f : 0

        week_hash[day_of_week(date).downcase.to_sym] = "#{miles > 0 ? format_round_to_quarter(miles) : ''}"

        date = date + 1
        total_days += 1.0 if miles > 0
        total_miles += round_to_half(miles) # TODO use exact?
      end

      weeks[week] ||= {total: 0.0, longest: 0.0}
      this_weeks_total = weeks[week][:total].to_f
      total_weeks += 1.0
      percent_increase = last_weeks_total != 0 ? ((this_weeks_total - last_weeks_total)*100/last_weeks_total).round(1) : 100.0
      long_percent = weeks[week][:total] && weeks[week][:total] > 0 ? (weeks[week][:longest]/weeks[week][:total] * 100).round(1) : 0
      longest = format_round_to_quarter(weeks[week][:longest])
      ave_per_week = format_round_to_quarter(total_miles/total_weeks)

      moving_ave.add(this_weeks_total)
      last_four_weeks = format_round_to_quarter(moving_ave.average)

      csv << [
        week,
        "",
        week_hash[:monday],
        week_hash[:tuesday],
        week_hash[:wednesday],
        week_hash[:thursday],
        week_hash[:friday],
        week_hash[:saturday],
        week_hash[:sunday],
        "#{format_round_to_quarter(this_weeks_total)}",
        "#{percent_increase}%",
        "#{longest}",
        "#{long_percent}%",
        "#{last_four_weeks}",
        "#{ave_per_week}"
      ]

      last_weeks_total = weeks[week][:total].to_f
      week = format_date(date.beginning_of_week)
    end
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
  lines = []

  smooth_weeks = 1

  temperature = MovingAverage.new(smooth_weeks)
  humidity = MovingAverage.new(smooth_weeks)
  ave_pace = MovingAverage.new(smooth_weeks)
  combined = MovingAverage.new(smooth_weeks)

  filestring = "date,ave_pace,temperature,humidity,combined\n"
  data.each do |row|
    next if row['Type'] != "Running"

    datestring = row['Date']
    time = Chronic.parse(datestring).to_datetime
    next if time >= DateTime.current.beginning_of_day


    temperature_f = weather.get_temperature_at_time(time).to_f
    humidity_f = weather.get_humidity_at_time(time).to_f
    ave_pace_f = string_to_float(row['Average Pace'])
    combined_f = humidity_f + temperature_f

    if temperature_f.to_f > -99 && ave_pace_f.to_f < 20 && humidity_f.to_f > 0
      temperature.add temperature_f
      humidity.add humidity_f
      ave_pace.add ave_pace_f
      combined.add combined_f

      temperature_s = format_round_to_quarter(temperature)
      humidity_s = format_round_to_quarter(humidity)
      ave_pace_s = format_round_to_quarter(ave_pace)
      combined_s = format_round_to_quarter(combined)
      # puts "#{pretty_date(time).rjust(25)}: #{time.strftime('%l:%M %p')} #{temperature} #{ave_pace}" if temperature.to_f > -99 && ave_pace.to_f < 15
      lines << "#{format_date(time)},#{ave_pace_s},#{temperature_s},#{humidity_s},#{combined_s}\n"
    end
  end
  lines.reverse.each {|line| filestring << line}

  puts filestring if debug

  File.open(filename, "w") do |f|
    f.write(filestring)
    f.close
  end
end

def write_daily_weather_horizontal(filename, debug = false) # for highcharts
  puts "Writing weather file to #{filename}"
  data = get_data
  date = DateTime.parse(data.first['Date'])
  weather = WeatherUtils.new

  filestring = ""

  rows = {}
  rows["time"] = []
  rows["temperature"] = []
  rows["humidity"] = []
  rows["ave_pace"] = []
  rows["combined"] = []

  smooth_weeks = 5

  temperature = MovingAverage.new(smooth_weeks)
  humidity = MovingAverage.new(smooth_weeks)
  ave_pace = MovingAverage.new(smooth_weeks)
  combined = MovingAverage.new(smooth_weeks)

  data.each do |row|
    next if row['Type'] != "Running" # TODO also skip treadmill days

    datestring = row['Date']
    time = Chronic.parse(datestring).to_datetime
    # temperature = weather.get_temperature_at_time(time).to_f
    # humidity = weather.get_humidity_at_time(time).to_f
    # ave_pace = format_round_to_quarter(string_to_float(row['Average Pace']))
    # combined = temperature + humidity

    temperature_f = weather.get_temperature_at_time(time).to_f
    humidity_f = weather.get_humidity_at_time(time).to_f
    ave_pace_f = format_round_to_quarter(string_to_float(row['Average Pace'])).to_f
    combined_f = temperature_f + humidity_f

    next unless (temperature_f.to_f > -99 && ave_pace_f.to_f < 16 && humidity_f.to_f > 0)


    temperature.add(temperature_f)
    humidity.add(humidity_f)
    ave_pace.add(ave_pace_f)
    combined.add(combined_f)

    # filestring << "#{format_date(time)},#{ave_pace},#{temperature},#{humidity},#{temperature + humidity}\n" if temperature.to_f > -99 && ave_pace.to_f < 16 && humidity > 0
    rows["time"] << "\"#{format_date(time)}\""
    rows["temperature"] << format_round_to_quarter(temperature.average)
    rows["humidity"] << format_round_to_quarter(humidity.average) # TODO There are some awfully suscpect humidities. 97% on 3/15? I guess that's right...?
    rows["ave_pace"] << format_round_to_quarter(ave_pace.average)
    rows["combined"] << format_round_to_quarter(combined.average)


  end


  rows.each do |k,v|
    filestring << "#{k},#{v.reverse.join(",")}\n\n"
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

# Date  Type  Route Name  Distance (mi) Duration  Average Pace  Average Speed (mph) Calories Burned Climb (ft)  Average Heart Rate (bpm)  Notes GPX File


weather = WeatherUtils.new
weather.download_days_for_range(@start_date, @end_date-1)
# weather.download_days_for_range(@start_date, @end_date-1, true) # forces a refresh for all of them. Don't do this takes like 20 mins
refresh_files # true # uncomment "true" to force a refresh. I usually don't want that

# print_field_by_day(["Duration", "Average Pace", "Calories Burned"], {
#   activity_types: ["Walking"]
#   # start_date: (DateTime.current-35).to_s,
#   # days: ["Monday", "Tuesday", "wednesday", "thursday", "friday"]
#   })

# print_field_by_day(["Distance (mi)"], {
#   activity_types: ["Hiking"]
#   })

begin # To include weather, uncomment
  write_daily_weather("run_weather.csv") # I often want this
  write_weather_graph_csv # write_daily_weather before running this. This is to make an awesome graph!
rescue Exception => e
  puts e
end
write_by_week("/Users/rebeccag/Desktop/run_detailed.csv") # this is the one I usually want


