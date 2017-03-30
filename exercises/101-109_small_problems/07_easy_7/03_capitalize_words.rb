# 03_capitalize_words.rb
# Write a method that takes a single String argument and returns a new string that contains the original value of the argument, but the first letter of every word is now capitalized.

# You may assume that words are any sequence of non-blank characters, and that only the first character of each word must be considered.

def word_cap(string)
  result = []
  string.split.each { |word| result << word.capitalize}
  result.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# def word_cap(words)
#   words_array = words.split.map do |word|
#     word.capitalize
#   end
#   words_array.join(' ')
# end

# This can also be written more concisely as:

# def word_cap(words)
#   words.split.map(&:capitalize).join(' ')
# end