# 09_multiply_all_pairs.rb
# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(array1, array2)
  result = []
  array1.each do |factor1|
    array2.each { |factor2| result << factor1 * factor2}
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
