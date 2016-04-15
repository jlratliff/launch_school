def titleize(input_string)
  input_string.scan(/\w+/).each { |word| word.capitalize!}.join(' ')
end

p titleize('')
p titleize('This is a string')