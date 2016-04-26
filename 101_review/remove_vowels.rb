# remove_vowels.rb

VOWELS = 'aeiou'

def remove_vowels(lst_words)
  lst_words.map { |word| word.delete VOWELS}
end

p remove_vowels ['green', 'yellow', 'black', 'white']