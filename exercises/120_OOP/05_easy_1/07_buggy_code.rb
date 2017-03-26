# 07_buggy_code.rb
# Fix the following code so it works properly:

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678

# Solution 1: Change increment_mileage to:

# def increment_mileage(miles)
#   total = mileage + miles
#   self.mileage = total
# end
# Solution 2: Change increment_mileage to:

# def increment_mileage(miles)
#   total = mileage + miles
#   @mileage = total
# end
# Discussion

# The problem with this code is that we are attempting to use a setter method for the @mileage instance variable like this:

# mileage = total
# All this manages to do is create a local variable named mileage. When we run the code, the output is thus 5000, not the expected 5678.

# To access the setter method, we need to provide an explicit receiver:

# self.mileage = total
# or refer to the instance variable directly:

# @mileage = total
# Solution 2 bypasses the setter method entirely, which may not be what you want. It is usually safer to use the explicit self. receiver if you have a setter method unless you have a good reason to use the instance variable directly. (We say that calling the setter method, if available, is safer since it may have have some special processing that would be bypassed if we set the instance variable directly.)