class Cat

  def initialize(name, color = 'purple')
    @name = name
    @color = color
  end

  def greet
    puts "Hello. My name is #{@name} and I'm a #{@color} cat."
  end

end

kitty = Cat.new('Sophie')

kitty.greet