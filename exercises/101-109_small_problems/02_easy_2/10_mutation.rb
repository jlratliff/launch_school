# 10_mutation.rb

# What will the following code print, and why? Don't run the code until you have tried to answer.

# This function copies by reference
def copy_array(array)
  new_array = []
  array.each { |value| new_array << value}
  new_array
end

# This function copies by value
def copy_array2(array)
  new_array = array.map(&:dup)
end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = copy_array(array1)
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
p array1
p array2