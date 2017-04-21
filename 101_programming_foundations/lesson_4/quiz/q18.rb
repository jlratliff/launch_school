#1

# numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]

# odd_numbers = numbers.select do |number|
#                 number.odd?
#               end

# even_numbers = numbers.select do |number|
#                 number.even?
#               end

# p odd_numbers, even_numbers

# 2
# numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
# odd_numbers = []
# even_numbers = []

# numbers.each do |number|
#   if number.even?
#     even_numbers << number
#   elsif number.odd?
#     odd_numbers << number
#   end
# end

# p odd_numbers, even_numbers

# numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
# odd_numbers = []
# even_numbers = []

# for number in numbers
#   next if number.odd?
#   even_numbers << number
# end

# for number in numbers
#   next unless number.odd?
#   odd_numbers << number
# end

# p odd_numbers, even_numbers


numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers, even_numbers = numbers.partition do |number|
                              number.even?
                            end

p odd_numbers, even_numbers
