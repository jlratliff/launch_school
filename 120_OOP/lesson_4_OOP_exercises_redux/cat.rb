class Cat
  attr_reader :type

  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end

  def to_s
    "I am a #{self.type} cat"
  end
end

tabby = Cat.new("tabby")
calico = Cat.new("calico")

puts tabby