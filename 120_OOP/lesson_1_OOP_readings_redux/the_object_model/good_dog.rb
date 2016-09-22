# good_dog.rb
require 'pry'

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :height, :weight, :age

  def initialize(name, height, weight, age)
    @name = name
    @height = height
    @weight = weight
    @age = age * DOG_YEARS
  end

  def speak
    "#{name} says Arf!"
  end

  def change_info(name, height, weight)
    self.name = name
    self.height = height
    self.weight = weight
  end

  def info
    "#{name} weighs #{weight} and is #{height}"
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end

  def what_is_self
    self
  end

end

sparky = GoodDog.new("Sparky", "12 inches", "10 lbs", 4)
p sparky.what_is_self