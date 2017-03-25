# 06_letter_counter.rb
# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(string)
  counts = {}
  string.split.each do |word|
    key = word.length
    counts.has_key?(key) ? counts[key] += 1 : counts[key] = 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each do |word|
#     counts[word.size] += 1
#   end
#   counts
# end