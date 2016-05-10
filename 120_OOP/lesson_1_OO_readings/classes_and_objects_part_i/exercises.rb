# 1. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :year, :color, :model

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def car_info
    puts "#{self.color.capitalize} #{self.year} #{self.model} traveling #{self.speed} mph"
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
end

car = MyCar.new("1975", "brown", "Datsun B210")
car.car_info
car.speed_up(30)
car.car_info
car.brake
car.car_info
car.shut_off
car.car_info
car.change_color("green")
car.car_info
puts car.year
car.spray_paint

