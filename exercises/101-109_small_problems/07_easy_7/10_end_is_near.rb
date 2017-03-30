# 10_end_is_near.rb
# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(string)
  string.split.reverse[1]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'