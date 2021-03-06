require 'csv'
require "rails"


module RunkeeperHelper


# Date	Type	Route Name	Distance (mi)	Duration	Average Pace	Average Speed (mph)	Calories Burned	Climb (ft)	Average Heart Rate (bpm)	Notes	GPX File
	class MovingAverage
		def initialize(size)
			@size = size
			@queue = []
		end

		def values
			@queue
		end

		def reset
			@queue = []
		end

		def add(value)
			@queue << value.to_f
			@queue.shift if @queue.size > @size
		end

		def average
			return 0 if @queue.size == 0
			@queue.inject(0.0) {|sum, x| sum + x}/@queue.size
		end

		def to_s
			self.average
		end

		def to_f
			self.average.to_f
		end

		def to_i
			self.average.to_i
		end

		def +(other)
			self.average + other.to_f
		end

		def *(other)
			self.average * other.to_f
		end

		def /(other)
			self.average / other.to_f
		end

		def -(other)
			self.average - other.to_f
		end

		def length
			@queue.length
		end

		def size
			@queue.length
		end
	end

	def get_data(filename)
	  file = File.open(filename, "r")
	  file_string = file.read
	  data = CSV.parse(file_string, {:headers=> true})
	end

	def format_date(date)
		date.strftime("%-m/%-d/%Y")
	end

	def pretty_date(date)
		date.strftime("%A, %-m/%-d/%Y").ljust(23)
	end

	def round_to_half(n)
		(n*2.0).round/2.0
	end

	def round_to_quarter(n)
		(n*4.0).round/4.0
	end

	def format_round_to_half(n)
		x = round_to_half(n)
		sprintf("%g", x)
	end

	def format_round_to_quarter(n)
		x = round_to_quarter(n)
		sprintf("%g", x)
	end

	def myfitnesspal_date(date)
		date.strftime("%Y-%m-%d")
	end

	def string_to_float(value, field="Duration")
		return 0 if value.nil?
		result = if value.include?(":")
			backwards = value.split(":").reverse
			seconds = backwards[0] ? backwards[0].to_f : 0.0
			minutes = backwards[1] ? backwards[1].to_f : 0.0
			hours = backwards[2] ? backwards[2].to_f : 0.0

			hours * 60 + minutes + seconds/60.0
		elsif value.respond_to?(:to_f)
			value.to_f # TODO will never reach else because all strings respond to to_f...
		else
			nil
		end
	end

	def is_desired_day?(date, days)
		is_desired = false
		days = [days] unless days.respond_to?(:map)
		days.map { |day| is_desired ||= date.send "#{day.downcase}?" }
		is_desired
	end

	def get_stats_for_hash(hash)
		stat_hash = {}
		fields = hash.keys
		fields.map {|f| stat_hash[f] = {}}

		hash.keys.each do |field|
			if hash[field].first && !hash[field].first.is_a?(DateTime)
				list = hash[field].sort
				sum = list.inject(0.0) {|sum,v| sum + v}
				ave = sum/list.count
				median = list[list.count/2]
				stat_hash[field][:ave] = ave
				stat_hash[field][:median] = median
				stat_hash[field][:min] = list.min
				stat_hash[field][:max] = list.max
			end

		end
		stat_hash
	end

	# fitbit_csv = date_hash CSV.parse(File.open(FITBIT_PATH), {headers: true}) # needs headers: true
	def date_hash(csv)
	  headers = csv.headers
	  key = headers.delete headers.first
	  # headers.delete("Date")

	  final_hash = {"headers" => headers}

	  csv.each do |line|
	    hash = {}
	    date = line[key]

	    headers.each do |field|
	      hash[field] = line[field]
	    end

	    final_hash[date] = hash
	  end

	  final_hash
	end

	def get_mondays(start_date, end_date)
		(start_date..end_date).select(&:monday?)
	end

	def days_of_week
		days = Date::DAYNAMES.dup
		days << days.delete(days.first)
		days
	end

	def day_of_week(date)
		date.strftime("%A")
	end
end


