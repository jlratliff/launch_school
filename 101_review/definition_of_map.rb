# map returns a new array based on the return value of the block. Each element is transformed based on the return value

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odds = arr.map do |n|
  n + 1
  puts n
  n.odd?
end

p odds

# returns an array of booleans