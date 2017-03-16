# 08_sum_or_product.rb

print "Please enter an integer greater than 0: "
value = gets.to_i

print "Enter 's' to compute sum, 'p' to compute product. "
operation = gets.chomp

if operation == 's'
  puts "The sum of the integers between 1 and #{value} is " +
       "#{(1..value).reduce(:+)}."
elsif operation == 'p'
  puts "The product of the integers between 1 and #{value} is " +
       "#{(1..value).reduce(:*)}."
else
  puts "Invalid operation."
end

# def compute_sum(number)
#   total = 0
#   1.upto(number) { |value| total += value }
#   total
# end

# def compute_product(number)
#   total = 1
#   1.upto(number) { |value| total *= value }
#   total
# end

# puts ">> Please enter an integer greater than 0"
# number = gets.chomp.to_i

# puts ">> Enter 's' to compute the sum, 'p' to compute the product."
# operation = gets.chomp

# if operation == 's'
#   sum = compute_sum(number)
#   puts "The sum of the integers between 1 and #{number} is #{sum}."
# elsif operation == 'p'
#   product = compute_product(number)
#   puts "The product of the integers between 1 and #{number} is #{product}."
# else
#   puts "Oops. Unknown operation."
# end