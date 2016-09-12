class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

class Motorcycle < Vehicle
  @@wheels = 2
end

puts Motorcycle.wheels
puts Vehicle.wheels