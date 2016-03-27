#p5_finding_a_value_in_a_hash.rb
def find_value(hash, value)
  if hash.has_value?(value)
    puts "hash includes #{value}"
  else
    puts "hash does not include #{value}"
  end
end

h1 = { a: 1, b: 2, c: 3}

find_value(h1, 3)
find_value(h1, 4)