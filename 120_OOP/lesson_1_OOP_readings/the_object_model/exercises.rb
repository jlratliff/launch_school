# 1. How do we create an object in Ruby? Give an example of the creation of an object.

# We create objects in Ruby by instantiating classes. For example

class SomeClass
end

some_object = SomeClass.new

# 2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

# A module is a collection of behaviors that can be included (mixed into) an existing class. Once included in a class, module methods can be used as though they were defined in the class. For example

module SomeModule
  def some_method
  end
end

class SomeClass
  include SomeModule
end

some_object = SomeClass.new
some_object.some_method