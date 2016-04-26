# Example of a method that modifies its argument permanently
# mutate.rb

a = [1, 2, 3]

def mutate(array)
  array.pop
end

#puts "Before mutate method: #{a}"
x = mutate(a)
print x
#p "After mutate method: #{a}"
