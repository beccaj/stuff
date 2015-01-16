require 'json'
dir = "data"
type = "sleep"
files = Dir["#{dir}/#{type}*json"].sort

module SleepMethods
  SLEEP = 1
  RESTLESS = 2
  AWAKE = 3

  debug = false

  def sleep_vis(n)
    case n.to_i
    when 1 # sleep
      "."
    when 2 # restless
      ","
    when 3 # awake
      "'"
    end
  end

  def fell_asleep_at(sleep, opts={})
    start_sleep = 0
    end_sleep = 0
    debug = opts[:debug]
    return nil if sleep.first.nil?

    data = sleep.first["minuteData"]

    return nil if data.nil?

    values = data.map {|x| x["value"] }

    i = 0
    fell_asleep = nil

    while end_sleep < values.length
      start_sleep = end_sleep
      puts "*** Going through non-sleep" if debug
      while values[start_sleep].to_i != SLEEP && end_sleep < values.length
        start_sleep += 1
        end_sleep += 1

        puts "start_sleep: #{start_sleep} #{end_sleep}: #{end_sleep}" if debug
      end

      puts "*** Going through sleep" if debug
      while values[end_sleep].to_i == SLEEP && end_sleep < values.length
        end_sleep += 1
        puts "start_sleep: #{start_sleep} end_sleep: #{end_sleep}" if debug

      end

      if end_sleep - start_sleep >= 30
        fell_asleep = start_sleep
        break
      end

    end

    puts "Fell asleep index: #{fell_asleep}" if debug
    puts "Fell asleep at: " + data[fell_asleep]["dateTime"] if fell_asleep && debug

    return nil if fell_asleep.nil?

    fell_asleep_time = data[fell_asleep]["dateTime"]

  end

end



  def print_values
    # files = ["data/sleep-20141020.json"]
    files.each do |file|
      sleep = JSON.parse(File.read(file))

      puts file
      # puts sleep["sleep"].first.keys
      next unless sleep["sleep"].first

      data = sleep["sleep"]#.first["minuteData"]
      values = data.map {|x| x["value"] }
      pretty_values = data.map {|x| sleep_vis(x["value"])}



      i = 0
      display = ""

      puts fell_asleep_at(sleep["sleep"])
      # while i < pretty_values.length
      #   val = pretty_values[i]
      #   count = 1

      #   while pretty_values[i] == val
      #     count += 1
      #     i += 1
      #   end

      #   count = [1, count].max
      #   display << (1..(count/3.0).round).map {val}.join
      # end

      # puts "Original:"
      # puts pretty_values.join
      # puts "Compressed:"
      # puts display
  end

end
