# Ex09.rb

h = { a:1, b:2, c:3, d:4 }

puts h[:b]
h[:e] = 5
h.each { |k, v| h.delete(k) if v < 3.5 }
puts h
