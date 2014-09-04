require 'fitbit'
require 'rails'
require 'json'
require 'fileutils'
include FileUtils
# require_relative '../runkeeper_helper'

@start_date = DateTime.parse("2014/8/15") # when I got the fitbit!
@summary_file = "summary.json"

consumer_key = '9491ce6178664f87bdf7c81a16908359'
consumer_secret = 'cfe917c341a949d7ac4f0695c16bd32b'
token = '4dc2f3c65968cf983334ddf5fade0d0d'
secret = '5bba0b0ea3e790239b04f41ae5bf12c4'
user_id = '2VFYJZ' # may be similar to '12345N'

@client = Fitbit::Client.new({:consumer_key => consumer_key, :consumer_secret => consumer_secret, :token => token, :secret => secret, :user_id => user_id})
access_token = @client.reconnect(token, secret)


def pretty_minutes_to_hours(minutes)
	minutes =  minutes.to_i
	hours = minutes / 60
	minutes = minutes % 60

	result = hours > 0 ? "#{hours}h " : ""
	result << "#{minutes}m" if minutes > 0
	result = "0m" if result.blank?

	result
end

def date_for_parsing(date)
	date.strftime("%Y/%-m/%-d")
end

# stolen from runkeeper
def format_date(date)
	date.strftime("%-m/%-d/%Y")
end

def pretty_date(date)
	day = date.strftime("%A").ljust(9)
	numbers = date.strftime("%-m/%-d/%Y")
	"#{day}, #{numbers}".ljust(21)
	# date.strftime("%A, %-m/%-d/%Y").ljust(23)
end	

def get_json
	file = File.open(@summary_file)
	json = JSON.parse(File.read(file))
end

def puts_sedentary_minutes
	puts "Sedentary Minutes"
	start_date = @start_date
	end_date = DateTime.current

	json = get_json.to_hash


	json.each do |row|
		minutes = row[1]["sedentaryMinutes"]
		duration = pretty_minutes_to_hours(minutes)
		date = DateTime.parse(row[0])
		puts "#{pretty_date(date)}: #{duration} (#{minutes}m)"		
	end
end

def puts_very_active_minutes
	puts "Very Active Minutes"
	json = get_json.to_hash

	json.each do |row|
		minutes = row[1]["veryActiveMinutes"]
		duration = pretty_minutes_to_hours(minutes)
		date = DateTime.parse(row[0])
		puts "#{pretty_date(date)}: #{duration} (#{minutes}m)"		
	end
end

def backup_file(filename)
	cp filename, "./backups/#{filename.gsub('.json', '')}-#{DateTime.current.to_i}.json"
end

def get_summary(filename = @summary_file)
	puts "Getting full summary"
	start_date = @start_date
	end_date = DateTime.current
	hash = {}

	backup_file(filename)

	while start_date <= end_date
		summary = @client.activities_on_date(start_date)['summary']
		hash[date_for_parsing(start_date)] = summary
		start_date += 1
	end

	filestring = hash.to_json
	puts filestring
	File.write(filename, filestring)
end

# p client.user_info

# get_summary # hits the API, run once a day. Limit 150 requests an hour

puts_sedentary_minutes
puts 
puts_very_active_minutes
