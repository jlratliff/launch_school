# 08_kind_assertions.rb

# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Fixnum, Float, etc).

assert_kind_of Numeric, value