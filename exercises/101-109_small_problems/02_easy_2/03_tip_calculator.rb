# 03_tip_calculator.rb

# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

print 'What is the bill? '
bill = gets.to_f

print 'What is the tip percentage? '
tip_percentage = gets.to_f / 100

tip = bill * tip_percentage
total = bill + tip

puts "The tip is $#{tip.round(1)}"
puts "The total is #{total.round(1)}"

# print 'What is the bill? '
# bill = gets.chomp
# bill = bill.to_f

# print 'What is the tip percentage? '
# percentage = gets.chomp
# percentage = percentage.to_f

# tip   = (bill * (percentage / 100)).round(2)
# total = (bill + tip).round(2)

# puts "The tip is $#{tip}"
# puts "The total is $#{total}"