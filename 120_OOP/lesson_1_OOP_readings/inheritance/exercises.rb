#require "pry"

class Vehicle
  attr_accessor :year, :color, :model

  @@num_vehicles = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@num_vehicles += 1
  end

  def self.total_num_vehicles
    @@num_vehicles
  end

  def self.mileage(gallons, miles)
    puts "#{miles / gallons} mpg is your mileage."
  end

  def to_s
    "#{self.color.capitalize} #{self.year} #{self.model.capitalize} traveling #{self.speed} mph"
  end

  def change_color(color)
    self.color = color
  end

  def spray_paint
    puts "What color: "
    color = gets.chomp
    change_color(color)
    puts "Your #{self.year} #{self.model} has been painted #{self.color}."
  end

  def year
    @year
  end

  def speed
    @speed
  end

  def speed_up(delta)
    @speed += delta
  end

  def brake
    if @speed > 0
      @speed -= 3
    end
  end

  def shut_off
    @speed = 0
  end

  def age
    calc_age
  end

  private

  def calc_age
    Time.now.year - self.year.to_i
  end

end

module Shiftable
  def shift
    "I have a standard transmission."
  end
end

class MyCar < Vehicle
  DOORS = 4
end

class MyTruck < Vehicle
  include Shiftable
  DOORS = 2
end

car = MyCar.new("1975", "brown", "datsun")
# truck = MyTruck.new("1983", "white", "blazer")
puts car.age
