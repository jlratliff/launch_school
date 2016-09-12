def reduce(array, default = 0)
  counter = 0
  accumulator = default

  while counter < array.size
    puts "acc = #{accumulator} and num = #{array[counter]}"
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  accumulator
end

array = [1, 2, 3, 4, 5]

x = reduce(array) { |acc, num| acc + num }

p x