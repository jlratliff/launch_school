# sort2.rb

arr = ['10', '11', '9', '7', '8']

# new_arr = arr.sort do |a,b|
#   b.to_i <=> a.to_i
# end

new_arr = arr.sort_by! do |element|
  element.to_i
end

p arr