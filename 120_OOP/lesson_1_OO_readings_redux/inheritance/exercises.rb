# EX 1
class Vehicle
  attr_accessor :color, :model, :speed
  attr_reader :year

  @@number_of_vehicles = 0

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def self.mileage(gallons, miles)
    puts Float(miles) / gallons
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
  end

  def spray_paint(color)
    self.color = color
    puts "Your car is now #{self.color}"
  end

  def speedup(amount)
    self.speed += amount
    puts "Speed is #{self.speed}"
  end

  def slow_down(amount)
    self.speed -= amount
    puts "Speed is #{self.speed}"
  end

  def brake
    self.speed = 0
    puts "You stopped the vehicle."
  end

  def shutoff
    puts "Car vehicle."
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

module Pushable
  def can_push?(pounds)
    pounds < 2000 ? true : false
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  include Pushable
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end

car = MyCar.new(1928, "brown", "Datsun")
truck = MyTruck.new(1955, "green", "Ford")

puts car.age