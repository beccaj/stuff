require 'rails'

MILES = 100.0
TOTAL_DAYS = 30.0
START_DATE = Date.parse("2015/11/29")
END_DATE = Date.parse("2015/12/29")

def should_run(start_date = START_DATE, date = Date.today, starting_miles = 0)
  date = date.try(:to_date)
  total_days = (END_DATE - start_date).to_i + 1
  days = (date - start_date).to_i + 1

  (MILES - starting_miles) * days/total_days + starting_miles
end


def print_plan(start_date = Date.today, starting_miles = 0)
  start_date = start_date.try(:to_date)
  (start_date..END_DATE).each do |date|
    puts "#{date}: #{should_run(start_date, date, starting_miles).round(1)}"
  end
end

def run_program
  print "How many miles have you run so far: "
  miles_run = gets.to_f
  date = Date.today
  date = START_DATE if date < START_DATE

  print_plan(date, miles_run)
end

run_program