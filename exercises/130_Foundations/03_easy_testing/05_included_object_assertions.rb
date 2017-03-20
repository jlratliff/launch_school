# 05_included_object_assertions.rb

assert_includes list, 'xyz'

# assert_includes list, 'xyz'
# Discussion

# #assert_includes tests whether its first argument contains the second argument. You can use:

# assert_equal true, list.include?('xyz')
# instead, but #assert_includes is clearer and issues a better failure message.