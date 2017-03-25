# 10_bannerize.rb

# Write a method that will take a short line of text, and print it within a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# You may assume that the input will always fit in your terminal window.

def print_in_box(string)
  print '+'
  (string.size + 2).times { print '-'}
  puts '+'
  print '|'
  (string.size + 2).times { print ' '}
  puts '|'
  puts '| ' + string + ' |'
  print '|'
  (string.size + 2).times { print ' '}
  puts '|'
  print '+'
  (string.size + 2).times { print '-'}
  puts '+'
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

# def print_in_box(message)
#    horizontal_rule = "+#{'-' * (message.size + 2)}+"
#    empty_line = "|#{' ' * (message.size + 2)}|"

#    puts horizontal_rule
#    puts empty_line
#    puts "| #{message} |"
#    puts empty_line
#    puts horizontal_rule
# end