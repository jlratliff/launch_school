#e3q1
require "pry"
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    puts "Hello"
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
binding.pry
