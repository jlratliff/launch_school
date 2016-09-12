class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    @first_name = name
    @last_name = ''
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def name=(input_name)
    parts = input_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def to_s
    name
  end

end

bob = Person.new('Robert')
puts bob.name
puts bob.first_name
puts bob.last_name
bob.last_name = 'Smith'
puts bob.name

bob.name = 'John Adams'
puts bob.first_name
puts bob.last_name