# 10_grocery_list.rb

# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(fruits)
  result = []
  fruits.each do |pair|
    pair.last.times { |i| result << pair.first}
  end
  result
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# def buy_fruit(list)
#   list.map { |fruit, quantity| [fruit] * quantity }.flatten
# end