# Q10.rb
require "pry"
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

bag = Bag.new("green", "cloth")

vars = bag.instance_variables

vars.each do |var|
  puts "#{var} = ".+(bag.instance_variable_get(var))
end