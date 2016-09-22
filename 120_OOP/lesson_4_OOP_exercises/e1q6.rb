# Q6.rb

class Cube
  def initialize(volume)
    @volume = volume
  end
end

cube = Cube.new(20)
vars = cube.instance_variables
puts cube.to_s