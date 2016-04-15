hsh = {}
statement = "The Flintstones Rock"
statement.each_char do |char|
  hsh[char] = statement.count(char) unless char == ' '
end

puts hsh