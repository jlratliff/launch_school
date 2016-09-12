class Integ
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def **(other_value)
    self.value + other_value.value
  end
end

int1 = Integ.new(5)
int2 = Integ.new(3)

puts int1 ** int2