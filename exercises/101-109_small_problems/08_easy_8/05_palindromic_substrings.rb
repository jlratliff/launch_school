# 05_palindromic_substrings.rb
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.


def substrings_at_start(string)
  result = []
  1.upto(string.size) do |substring|
    result << string.slice(0, substring)
  end
  result
end

def substrings(string)
  result = []
  until string.empty?
    result << substrings_at_start(string)
    string.slice!(0)
  end
  result.flatten
end

def is_palindrome?(string)
  string == string.reverse and string.size > 1
end

def palindromes(string)
  substrings = substrings(string)
  results = []
  substrings.each { |substr| results << substr if is_palindrome?(substr)}
  results
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]