#p2_merge_test.rb
h1 = { a: 1, b: 2, c: 3}
h2 = { c: 20, d: 4, e: 5}

p h1.merge(h2)
p h1

p h1.merge!(h2)
p h1