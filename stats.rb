module Stats
  def average(numbers)
    numbers.inject(0.0) {|sum, x| sum + x}/numbers.length
  end

  def correlation(first_list, second_list)
    raise "Length of the two lists must match" unless first_list.length == second_list.length

    covariance(first_list, second_list)/(standard_deviation(first_list) * standard_deviation(second_list))
  end

  def covariance(first_list, second_list)
    raise "Length of the two lists must match" unless first_list.length == second_list.length
    sum = 0.0
    first_ave = average(first_list)
    second_ave = average(second_list)

    first_list.each_with_index do |first, index|
      second = second_list[index]
      sum += (first - first_ave) * (second - second_ave)
    end

    sum/(first_list.length-1)
  end

  def standard_deviation(list)
    average = average(list)
    sum = 0.0

    list.each do |item|
      sum += (item - average)**2
    end

    (sum/(list.length-1))**0.5
  end
end
