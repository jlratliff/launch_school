def inc(num)
  num + 1
end

arr = [1, 2, 3]
arr.map { |element| element + 1 } # => [2, 3, 4]
p arr.map(&:inc)