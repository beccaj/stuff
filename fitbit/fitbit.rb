require "fitgem"
require "pp"
require "yaml"
require 'rails'
require 'json'
require 'csv'
require_relative '../runkeeper_helper'
require_relative 'sleep'


include RunkeeperHelper
include SleepMethods

# Load the existing yml config
config = begin
  Fitgem::Client.symbolize_keys(YAML.load(File.open(".fitgem.yml")))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
  exit
end

@client = Fitgem::Client.new(config[:oauth])
@data_dir = "data"
@start_date = DateTime.parse("2014/8/15") # when I got the fitbit!

def filename_for_date(date, prefix) # for writing summary data
  formatted_date = date.strftime("%Y%m%d")
  "#{prefix}-#{formatted_date}.json"
end

def get_method_name(type)
  case type
    when "weight"
      :body_measurements_on_date
    when "summary"
      :activities_on_date
    else
      "#{type}_on_date".to_sym
    end
end

def get_activities(type, opts = {})
  dir = opts[:directory] || @data_dir
  force = opts[:force]
  start_date = opts[:start_date] || @start_date
  end_date = opts[:end_date] || DateTime.yesterday
  debug = opts[:debug]

  method_name = get_method_name(type)

  puts "Writing #{type} to #{dir}"

  (start_date..end_date).each do |date|
    filename = "#{dir}/#{filename_for_date(date, type)}"
    if File.exist?(filename) && !force
      puts "-- Skipping #{filename}" if debug
      next
    end

    json = @client.send(method_name, date)

    if json["error"].present?
      puts "Error for #{filename} (probably exceeded limit):\n #{JSON.pretty_generate(json)}"
    else
      filestring = JSON.pretty_generate(json)
      puts "Writing #{filename}"
      File.write(filename, filestring)
    end

  end
end

def get_sleep(opts = {})
  get_activities("sleep", opts)
end

def get_summaries(opts = {})
  get_activities("summary", opts)
end

def get_weight(opts = {})
  get_activities("weight", opts)
end


def remove_all_errors(opts = {})
  puts "Removing errors"
  dir = opts[:directory] || @data_dir
  Dir["#{dir}/*json"].each do |file|
    s = File.read(file)
    if s.include?("error") || s == ""
      puts "Error for #{file}"
      File.delete(file)
    end
  end
end

def get_all_activities(opts = {})
  remove_all_errors
  types = ["summary", "weight", "sleep"]

  types.each do |type|
    get_activities(type, opts)
  end
end

def date_from_filename(filename)
  /(\d{8})\./.match filename
  DateTime.parse($1)
end

def write_weight(opts = {})
  dir = opts[:directory] || @data_dir
  type = "weight"
  files = Dir["#{dir}/#{type}*json"].sort

  filestring = "Date,Weight,Bf%\n"

  files.each do |file|
    hash = JSON.parse(File.read(file))
    date = date_from_filename(file)
    weight = hash["body"]["weight"]
    fat = hash["body"]["fat"]
    pretty_date = date.strftime("%-m/%-d/%Y")
    filestring << "#{pretty_date},#{weight},#{fat}\n"
  end

  File.write("weight.csv", filestring)
end

def write_sleep(opts = {})
  dir = opts[:directory] || @data_dir
  type = "sleep"
  files = Dir["#{dir}/#{type}*json"].sort

  filestring = "Date,Minutes Asleep,Hours Asleep\n"

  files.each do |file|
    hash = JSON.parse(File.read(file))
    date = date_from_filename(file)

    total_minutes = hash["summary"]["totalMinutesAsleep"].to_i

    hours = total_minutes / 60
    minutes = total_minutes % 60

    pretty_minutes = "#{hours}h #{minutes}m"

    pretty_date = date.strftime("%-m/%-d/%Y")
    filestring << "#{pretty_date},#{total_minutes},#{pretty_minutes}\n"
  end

  File.write("sleep.csv", filestring)

end

def write_csvs(opts = {})
  dir = opts[:directory] || @data_dir
  force = opts[:force]
  start_date = opts[:start_date] || @start_date
  end_date = opts[:end_date] || DateTime.yesterday
  debug = opts[:debug]

  csv_name = "fitbit.csv"

  puts "Writing #{csv_name}"

  filestring = CSV.generate do |csv|
    csv << ["Date", "Weight", "Body Fat", "Lean Mass", "Sleep Minutes", "Sleep Time", "Fell Asleep At", "Steps", "Calories Burned", "Sedentary Minutes", "Lightly Active Minutes", "Fairly Active Minutes", "Very Active Minutes"]

    (start_date..end_date).each do |date|
      pretty_date = date.strftime("%-m/%-d/%Y")
      line = [pretty_date]
      suffix = filename_for_date(date, "")


      # WEIGHT
      filename = filename_for_date(date, "weight")
      file = "#{dir}/#{filename}"
      hash = JSON.parse(File.read(file))
      date = date_from_filename(file)

      lean_mass = (100 - hash["body"]["fat"].to_f)/100 * hash["body"]["weight"]

      line << hash["body"]["weight"]
      line << hash["body"]["fat"]
      line << lean_mass.round(1)


      # SLEEP
      filename = filename_for_date(date, "sleep")
      file = "#{dir}/#{filename}"
      hash = JSON.parse(File.read(file))
      date = date_from_filename(file)

      total_minutes = hash["summary"]["totalMinutesAsleep"].to_i

      slept_at = fell_asleep_at hash["sleep"]

      hours = total_minutes / 60
      minutes = total_minutes % 60

      pretty_minutes = "#{hours}h #{minutes}m"

      pretty_date = date.strftime("%-m/%-d/%Y")
      line << total_minutes
      line << pretty_minutes
      line << "#{slept_at}"

      # STEPS
      filename = filename_for_date(date, "summary")
      file = "#{dir}/#{filename}"
      hash = JSON.parse(File.read(file))
      date = date_from_filename(file)

      line << hash["summary"]["steps"]
      line << hash["summary"]["caloriesOut"]

      line << hash["summary"]["sedentaryMinutes"]
      line << hash["summary"]["lightlyActiveMinutes"]
      line << hash["summary"]["fairlyActiveMinutes"]
      line << hash["summary"]["veryActiveMinutes"]

      # FINISH LINE
      csv << line
    end
  end

  File.write(csv_name, filestring)
  # write_weight
  # write_sleep
end

def get_mondays(start_date, end_date)
  (start_date..end_date).select {|x| x.monday?}
end



def write_weekly(opts = {})
  dir = opts[:directory] || @data_dir
  force = opts[:force]
  start_date = opts[:start_date] || @start_date
  end_date = opts[:end_date] || DateTime.yesterday
  debug = opts[:debug]

  filestring = File.read("fitbit.csv")
  data = date_hash CSV.parse(filestring, {:headers=> true})
  fields = data["headers"]

  csv = CSV.generate do |line|
    line << ["Date"].concat(fields)
    get_mondays(start_date, end_date).each do |monday|

      ave = MovingAverage.new(7)
      ave_hash = {}
      fields.each {|f| ave_hash[f] = MovingAverage.new(7)}

      (monday..(monday + 6)).each do |date|
        date = format_date(date)
        row = data[date]

        if row
          # TODO pretty sleep and fell asleep at don't work
          fields.each {|f| ave_hash[f].add(row[f].to_f) if row[f].to_f > 0}
        end
      end

        puts "\n\n#{format_date(monday)}" if debug
        ave_hash.each {|k,v| puts "#{k}: #{v.values.join(' + ')} average: #{v.average}"} if debug
      line << [format_date(monday)].concat(fields.map do |f|
        case f
        when "Steps", "Calories Burned"
          ave_hash[f].average.round
        when "Body Fat"
          ave_hash[f].average.round(1)
        else
          round_to_quarter ave_hash[f].average
        end
      end)
    end
  end

  filename = "averages.csv"
  puts "Writing #{filename}"
  File.write(filename, csv)
end


get_all_activities
write_csvs
write_weekly(debug: false)

