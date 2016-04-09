# calculator.rb
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

puts('Welcome to calculator')
puts('First number: ')
num1 = gets().chomp()

puts('Second number: ')
num2 = gets().chomp()
puts num2.inspect()

puts('What operation? 1 = add, 2 = subtract, 3 = multiply, 4 = divide')
operator = gets().chomp()

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
elsif operator == '4' and num2 != '0'
  result = num1.to_f / num2.to_f
else
  result = "no result"
end

puts("The result is #{result}")