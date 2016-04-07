#read_file.rb

File.readlines("simple_file.txt").each_with_index do |line, line_num|
  puts "#{line_num}: #{line}"
end