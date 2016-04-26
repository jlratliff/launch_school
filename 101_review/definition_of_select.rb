# select returns a new array based on the 
# return value of the block. 
# If the block returns true the element is selected.

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odds = arr.select do |n|
  n + 1
  puts n
  n.odd?
end

p odds

# returns an empty array because the block returns
# false for each iteration