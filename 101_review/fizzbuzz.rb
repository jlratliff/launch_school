def fizzbuzz(start_num, end_num)
  (start_num..end_num).each do |num|
    if num % 15 == 0
      print '"FizzBuzz"'
    elsif num % 3 == 0
      print '"Fizz"'
    elsif num % 5 == 0
      print '"Buzz"'
    else
      print num.to_s
    end
    if num != end_num
      print ", "
    end
  end
  puts
end

p fizzbuzz(- 10, 15)