require 'pry'

def test(b)
  b.map!{ |letter| "I like the letter: #{letter}"}
  puts b.inspect
end

a = ['a', 'b', 'c']
test(a)
binding.pry