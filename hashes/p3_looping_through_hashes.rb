#p3_looping_through_hashes.rb
h1 = { a: 1, b: 2, c: 3}

keys = h1.keys
keys.select { |k| puts k}
keys.select { |k| puts h1[k]}
h1.select { |k, v| puts k.to_s + v.to_s}