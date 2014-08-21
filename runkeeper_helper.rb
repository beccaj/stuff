module RunkeeperHelper
# Date	Type	Route Name	Distance (mi)	Duration	Average Pace	Average Speed (mph)	Calories Burned	Climb (ft)	Average Heart Rate (bpm)	Notes	GPX File


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
end