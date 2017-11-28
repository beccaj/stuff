filename = ARGV.first

lines = File.read(filename).lines

result = ""

lines.each do |line|
  chars = line.chars
  chars.each_slice(70) do |new_line|
    result << "#{new_line.join.strip}\n"
  end
end

File.write(filename.gsub(".txt", "-truncated.txt"), result)