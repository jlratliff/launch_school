def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

p compare('hello') { |word| word.upcase }