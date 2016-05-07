# balancer.rb

def balancer(string)
  return false unless string.count('(') == string.count(')')
  paren_count = 0
#  string.split('').each do |char|
  string.each_char do |char|
    paren_count -= 1 if char == ')'
    paren_count += 1 if char == '('
    return false if paren_count < 0
  end
  true
end

p balancer('((x)')
