# 02_lettercase_counter.rb
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

def letter_case_count(string)
  uppercase_counter = 0
  lowercase_counter = 0
  neither_counter = 0
  string.chars.each do |letter|
    case letter
    when /[A-Z]/ then uppercase_counter += 1
    when /[a-z]/ then lowercase_counter +=1
    else neither_counter += 1
    end
  end
  { lowercase: lowercase_counter, uppercase: uppercase_counter, neither: neither_counter }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   counts
# end