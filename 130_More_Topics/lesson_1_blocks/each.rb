def each(array)
  counter = 0
  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

each([4, 5, 6]) { |num| puts num}