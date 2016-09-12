# good_dog.rb

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

module Smell
  def smell
    puts "sniffing"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
  include Smell
end

sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hello!")
bob.smell

puts "---GoodDog ancestors---"
puts GoodDog.ancestors

puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors
