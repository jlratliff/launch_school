# 08_palindromic_strings_part_1.rb
# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. (A palindrome reads the same forwards and backwards.) Case matters, and all characters should be considered.

def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# def palindrome?(string)
#   string == string.reverse
# end