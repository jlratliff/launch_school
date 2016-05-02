#select the element out of the array if its index is a fibonacci number

# fibonacci sequence is 0, 1, 1, 2, 3, 5, 8


def fibonacci?(integer)
  series = [0, 1]
  loop do
    series << series[series.length - 2] + series[series.length - 1]
    break if series.last >= integer
  end
  series.include?(integer)
end


def output_fibonacci(arr)
  index = -1
  arr.select do |element|
    index += 1
    fibonacci?(index)
  end

end

p output_fibonacci([3, 3, 9, 92, 23, 23, "x", 'p', 9, 11, 14])