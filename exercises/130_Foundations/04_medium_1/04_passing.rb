# 04_passing.rb
# When doing assignment from an array, we have several options available to us. If we want to assign the entire array to another variable, we can do that:

# birds = %w(raven finch hawk eagle)
# p birds # => ['raven','finch','hawk','eagle']
# If we want to assign multiple variables on one line, we may do that as well:

# raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p hawk # => 'hawk'
# p eagle # => 'eagle'
# But, what if we wanted to organize our array contents into categories, where variables represent category names. Could we do that without directly grabbing certain items from particular array indices?

# There is one way to do it, and that is by using the splat operator(*). We can do something like this:

# raven, finch, *birds_of_prey = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p birds_of_prey # => ['hawk','eagle']
# Based on the information given above, write a method that takes an array as an argument. In that method, yield the contents of the array to a block. In the block, write your block variables in such a way that the first two items are discarded, and the last two items are treated as birds of prey.

birds = %w(raven finch hawk eagle)

def method(array)
  yield(array)
end


method(birds) { |_,_,*birds_of_prey| puts "#{birds_of_prey}" }
