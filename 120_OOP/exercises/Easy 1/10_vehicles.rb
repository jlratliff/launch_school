class Vehicle
  attr_reader :make, :model, :wheels

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle

  def initialize(make, model)
    super
    @wheels = 4
  end

end

class Motorcycle < Vehicle

  def initialize(make, model)
    super
    @wheels = 2
  end

end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
    @wheels = 6
  end
end

car = Car.new("Datsun", "B210")
motorcycle = Motorcycle.new("Honda", "CD125")
truck = Truck.new("Ford", "F10", "2000 lbs")
puts car
puts motorcycle
puts truck