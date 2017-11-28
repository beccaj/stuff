require 'net/http'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'date'
require 'mechanize'
require 'csv'
require 'rails'
require 'chronic'
require_relative 'stats'
require_relative 'runkeeper_helper'

include Stats
include RunkeeperHelper

def calorie_correlation
  @debug = false

  csv = CSV.parse(File.read("calories.csv"), headers: true)
  # print csv.headers => ["Date", "Calories", "Carbs", "Fat", "Protein", "Carbs %", "Fat %", "Protein %"]
  headers = csv.headers
  hash = {}
  headers.each {|header| hash[header] = []}
  hash["Negative"] = [] # silly checks
  hash["Random"] = [] # silly checks

  calories = []
  protein = []
  csv.each do |line|
    next unless line["Date"] >= "2015-01-01" # TODO I think this is right

    headers.each do |header|
      hash[header] << line[header].to_f
      puts "#{line['Date']} #{header}: #{line[header].to_f}" if @debug
    end
    hash["Negative"] << 4000 - line["Calories"].to_f #line["Calories"].to_f * -1
    hash["Random"] << [-1, 0, 1].sample

    calories << line["Calories"].to_f
    # protein << line["Protein"].to_f
  end


  hash.each do |k,v|
    correlation = correlation(calories, v).round(1).to_s
    average = average(v).round(1).to_s
    standard_deviation = standard_deviation(v).round(1).to_s
    puts "#{k.ljust(10)}| average: #{average.rjust(7)}| sd: #{standard_deviation.rjust(6)}| correlation: #{correlation.rjust(3)}"
  end
  # puts correlation(calories, protein)
end

LIMIT = 1800

def longest_success
  puts "Finding stretches of days with calories under #{LIMIT}"
  csv = CSV.parse(File.read("calories.csv"), headers: true)
  # puts csv.headers.join(", ") # => Date, Calories, Carbs, Fat, Protein, Carbs %, Fat %, Protein %, Link
  hash = date_hash(csv)

  streak_start = nil #Chronic.parse(csv.first["Date"])
  streak_end = nil #streak_start.clone

  csv.each do |line|
    this_date = Chronic.parse(line["Date"]).to_date
    calories = line["Calories"].to_i
    if calories <= LIMIT && calories > 0
      streak_start ||= this_date
      streak_end = this_date
    else
      if streak_start && streak_end && (streak_end - streak_start).to_i > 1 #streak_start != streak_end
        puts "#{myfitnesspal_date(streak_start)} - #{myfitnesspal_date(streak_end)}: #{(streak_end - streak_start).to_i}"
      end
      streak_start = nil
      streak_end = nil
    end
  end
end

# calorie_correlation
longest_success


