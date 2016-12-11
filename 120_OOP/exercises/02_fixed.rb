require 'pry'
class FixedArray
  def initialize(max_size)
    @array = Array.new(max_size)
  end

  def [](index)
    @array.fetch(index)
  end

  def []=(index, value)
    @array.fetch(index)
    @array[index] = value
  end

  def to_a
    @array.clone
  end

  def to_s
    to_a.to_s
  end
end
binding.pry