def increment(number)
  if block_given?
    yield(number + 1)
  else
    number + 1
  end
end

increment(5) do |num|
  puts num
end