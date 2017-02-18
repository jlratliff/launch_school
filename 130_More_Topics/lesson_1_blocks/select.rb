def select(array)
  counter = 0
  return_array = []
  while counter < array.size
    if yield(array[counter])
      return_array << array[counter]
    end
    counter += 1
  end
  return_array
end

array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? }