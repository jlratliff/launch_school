def times(num)
  i = 0
  while i < num
    if block_given?
      yield(i)
    end
    i += 1
  end
  num
end

p times(5) { |num| puts num } 