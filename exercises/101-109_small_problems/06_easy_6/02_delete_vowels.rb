# 02_delete_vowels.rb
# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.
VOWELS = 'aeiouAEIOU'
def remove_vowels(array)
  result = []
  array.each do |word|
   result << word.chars.select { |letter| not VOWELS.include?(letter)}.join
 end
 result
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# def remove_vowels(strings)
#   strings.map { |string| string.delete('aeiouAEIOU') }
# end