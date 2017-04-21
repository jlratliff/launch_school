arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

p arr1 # => ["a", "b", "c"]
p arr2 # => ["A", "B", "C"]

p arr1 == arr2

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

p arr1 # => ["A", "B", "C"]
p arr2 # => ["A", "B", "C"]

p arr1 == arr2

arr3 = [1, 2, 3]

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end