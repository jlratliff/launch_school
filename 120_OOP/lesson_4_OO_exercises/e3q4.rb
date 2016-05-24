#e3q4.rb

class Cat
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{@type}"
  end
end

cat = Cat.new("tabby")

puts cat