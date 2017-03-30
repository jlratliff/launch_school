# 07_multiplicative_average.rb
# Write a method that takes an Array of integers as input, multiplies all of the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places.

# Examples:

# show_multiplicative_average([3, 5])
# The result is 7.500

# show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

def show_multiplicative_average(array)
  puts "The result is #{format("%.3f", array.reduce(:*)/array.size.to_f)}"
end


show_multiplicative_average([3, 5])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

# def show_multiplicative_average(numbers)
#   product = 1.to_f
#   numbers.each { |number| product *= number }
#   average = product / numbers.size
#   puts format('%.3f', average)
# end

