# 10_refactoring_vehicles.rb
# Consider the following classes:

# class Car
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def wheels
#     4
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Motorcycle
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def wheels
#     2
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Truck
#   attr_reader :make, :model, :payload

#   def initialize(make, model, payload)
#     @make = make
#     @model = model
#     @payload = payload
#   end

#   def wheels
#     6
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end
# Refactor these classes so they all use a common superclass, and inherit behavior as needed.

class Vehicle
  attr_reader :make, :model, :wheels

  def initialize(make, model, wheels)
    @make = make
    @model = model
    @wheels = wheels
  end

  def to_s
    "A #{make} #{model} has #{wheels} wheels."
  end
end

class Car < Vehicle
  def initialize(make, model, wheels)
    super
  end

end

class Motorcycle < Vehicle
  def initialize(make, model, wheels)
    super
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, wheels, payload)
    super(make, model, wheels)
    @payload = payload
  end

  def to_s
    "A #{make} #{model} has #{wheels} wheels and a #{payload} payload."
  end
end

car = Car.new('Datsun', 'B210', 4)
motorcycle = Motorcycle.new('Honda', 'CD125', 2)
truck = Truck.new('Ford', 'F150', 4, 2000)
puts car, motorcycle, truck