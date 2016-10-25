require 'pry'
class Pet
  attr_reader :name, :type
  def initialize(type, name)
    @type = type
    @name = name
  end

end

class Owner

  attr_accessor :name, :number_of_pets, :pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end

end

class Adoption
  attr_accessor :owner, :pet
  def initialize(owner, pet)
    @owner = owner
    @pet = pet
  end
end

class Shelter

  def initialize
    @adoptions = []
    @owners = []
  end

  def adopt(owner, pet)
    @owners << owner.name if not @owners.include?(owner.name)
    owner.number_of_pets += 1
    adoption = Adoption.new(owner, pet)
    @adoptions << adoption
  end

  def print_adoptions
    @owners.each do |owner|
      puts "#{owner} has adopted the following pets:"
      @adoptions.each do |adoption|
          puts "a #{adoption.pet.type} named #{adoption.pet.name}" if adoption.owner.name == owner
      end
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."