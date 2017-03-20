# 05_passing.rb
# Given this code:

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end
# Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:

# 1)

# gather(items) do | , |
#   puts
#   puts
# end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
# 2)

# gather(items) do | , , |
#   puts
#   puts
#   puts
# end
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!
# 3)

# gather(items) do | , |
#   puts
#   puts
# end
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!
# 4)

# gather(items) do | , , , |
#   puts
# end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

#4
gather(items) do | prod1, prod2, prod3, prod4|
  puts "#{prod1}, #{prod2}, #{prod3}, and #{prod4}"
end

# #3
# gather(items) do | apples, *produce |
#   puts "#{apples}"
#   puts "#{produce.join(', ')}"
# end

# #2
# gather(items) do | apples, *produce, wheat |
#   puts "#{apples}"
#   puts "#{produce.join(', ')}"
#   puts "#{wheat}"
# end

# #1
# gather(items) do | *produce, wheat |
#   puts "#{produce.join(', ')}"
#   puts "#{wheat}"
# end