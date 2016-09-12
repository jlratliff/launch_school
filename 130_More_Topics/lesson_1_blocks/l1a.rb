# Lesson 1.4 Writing methods that take blocks
def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system 'clear'
end