module Mammal
  class Dog
    def speak(sound)
      x = sound.class
      p x
      puts x
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak("Bow wow")
kitty.say_name("kitty")