class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

cat = Cat.new('Sophie')
cat.greet
cat.name = 'Luna'
cat.greet
