def test_loop_return(arr)
  # arr.each { |n| puts n}
  idx = 0
  loop do
    puts arr[idx]
    idx += 1
    break if idx == arr.size
  end
  arr[0] = 7
end

arr = [1, 2 ,3]

p test_loop_return(arr)