# 06_odd_numbers.rb
# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

#(1..99).each { |num| puts num unless num % 2 == 0}

(1..99).each { |num| puts num if num.odd? }

# value = 1
# while value <= 99
#   puts value
#   value += 2
# end