# write a method to determine if a word is a palindrome, without using the reverse method

def ispalindrome?(str)
  is_palindrome = true
  arr = str.split('')
  while arr.length > 1
    is_palindrome = false if arr.pop != arr.shift
  end
  is_palindrome
end



p ispalindrome?('')
p ispalindrome?('a')
p ispalindrome?('aa')
p ispalindrome?('radar')
p ispalindrome?('rada')



#p ispalindrome?('')

# return true
# return false