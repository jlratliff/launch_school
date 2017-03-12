# 04_how_many.rb
# Write a method that counts the number of 
# occurrences of each element in a given array.
# vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

# count_occurrences(vehicles)
# Once counted, print each element alongside the number of occurrences.

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

def count_occurrences(array)
  counts = {}
  array.each { |word| counts.include?(word) ? \
    counts[word] += 1 : counts[word] = 1}
  counts.each_pair { |key, value| puts "#{key} => #{value}" }
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

# def count_occurrences(array)
#   occurrences = {}

#   array.each do |element|
#     occurrences[element] = array.count(element)
#   end

#   occurrences.each do |element, count|
#     puts "#{element} => #{count}"
#   end
# end