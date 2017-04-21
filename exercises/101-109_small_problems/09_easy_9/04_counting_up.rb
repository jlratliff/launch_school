# 04_counting_up.rb

# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(integer)
  result = []
  1.upto(integer) { |num| result << num }
  result
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# def sequence(number)
#   (1..number).to_a
# end