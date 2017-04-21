# 05_multiply_numbers!.rb
def multiply(numbers, factor)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= factor

    counter += 1
  end
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)
p my_numbers