# 04_empty_object_assertions.rb

assert_equal true, list.empty?

Solution

# assert_empty list
# Discussion

# #assert_empty tests whether its first argument responds to the method #empty? with a true value. You can use:

# assert_equal true, list.empty?
# instead, but #assert_empty is clearer and issues a better failure message.
