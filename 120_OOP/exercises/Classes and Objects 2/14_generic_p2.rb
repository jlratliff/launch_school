class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is Sophie!"
  end


end

Cat.generic_greeting
kitty = Cat.new('Sophie')
kitty.personal_greeting