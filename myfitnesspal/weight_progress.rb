require "rails"
require_relative 'runkeeper_helper'
include RunkeeperHelper

FITBIT_PATH = "fitbit/averages.csv"
MYFITNESSPAL_PATH = "weekly_calories.csv"
RUNKEEPER_PATH = "/Users/rebeccag/Desktop/run_detailed.csv"

FILENAME = "weight_progress.csv"

@start_date = Date.new(2014, 12, 8)

mondays = get_mondays(@start_date, Date.today)

fitbit_csv = date_hash CSV.parse(File.open(FITBIT_PATH), {headers: true})
myfitnesspal_csv = date_hash CSV.parse(File.open(MYFITNESSPAL_PATH), {headers: true})
runkeeper_csv = date_hash CSV.parse(File.open(RUNKEEPER_PATH), {headers: true})

# puts fitbit_csv["headers"].join(", ")
# puts myfitnesspal_csv["headers"].join(", ")
# puts runkeeper_csv["headers"].join(", ")

# =>
# Weight, Body Fat, Lean Mass, Sleep Minutes, Sleep Time, Fell Asleep At, Steps, Calories Burned, Sedentary Minutes, Lightly Active Minutes, Fairly Active Minutes, Very Active Minutes
# Calories, Carbs, Fat, Protein, Carbs %, Fat %, Protein %, Link
# Week, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, Total, % Total Increase, Longest, Longest Percent, Last 4 weeks Total, Ave Weekly Total



filestring = CSV.generate do |csv|
  csv << [
    "Date",
    "Calories In Ave.",
    "Weight At End of Week ",
    "Ave. BF% At End of Week",
    "Fitbit Ave. Tdee ",
    "Miles Ru",
  ]

  mondays.each do |date|
    datestring = format_date(date)

    fitbit_line = fitbit_csv[datestring]
    myfitnesspal_line = myfitnesspal_csv[datestring]
    runkeeper_line = runkeeper_csv[datestring]

    csv << [
      datestring,
      myfitnesspal_line.try(:[], "Calories"),
      fitbit_line.try(:[], "Weight"),
      fitbit_line.try(:[], "Body Fat"),
      fitbit_line.try(:[], "Calories Burned"),
      runkeeper_line.try(:[], "Total")

    ]

    # puts "#{fitbit_line} #{myfitnesspal_line} #{runkeeper_line}"

  end


end

puts "Writing to #{FILENAME}"
File.write(FILENAME, filestring)


