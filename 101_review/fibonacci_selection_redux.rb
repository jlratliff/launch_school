#select the element out of the array if its index is a fibonacci number

# fibonacci sequence is 0, 1, 1, 2, 3, 5, 8

def fibonacci?(integer)
  series = [0, 1]
  while series.last <= integer
    series << series[series.length - 2] + series[series.length - 1]
  end
  series.include?(integer)
end


def fibonacci_element(arr)
  index = -1
  arr.select do |element|
    index += 1
  end
end

p fibonacci_element()

# expect [1, 2, 2, 4, 6, 9]