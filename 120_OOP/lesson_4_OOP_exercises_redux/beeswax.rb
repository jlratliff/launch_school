require "pry"
class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} type of Bees Wax"
  end
end

binding.pry