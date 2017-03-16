# 03_find_missing_numbers.rb
# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# Examples:

# missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# missing([1, 2, 3, 4]) == []
# missing([1, 5]) == [2, 3, 4]
# missing([6]) == []

def missing(sorted_array)
  missing_elements = []
  (sorted_array.first..sorted_array.last).each do |num|
    missing_elements << num unless sorted_array.include?(num)
  end
  missing_elements
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end