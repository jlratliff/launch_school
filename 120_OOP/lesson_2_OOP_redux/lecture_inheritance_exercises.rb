class Pet

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end

  def swim
    'swimming!'
  end
end

class Cat < Pet
  def speak
    'meow~~'
  end
end

class Bulldog < Dog

  def swim
    "can't swim :("
  end
end

puts '---regular Dog---'
teddy = Dog.new
puts teddy.speak
puts teddy.swim
puts '---Bulldog---'
franky = Bulldog.new
puts franky.speak
puts franky.swim
puts '---Cat---'
kitty =Cat.new
puts kitty.speak
puts '---generic Pet---'
pete = Pet.new
pete.run
pete.speak