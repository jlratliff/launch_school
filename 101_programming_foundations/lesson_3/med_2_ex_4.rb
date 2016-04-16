sentence = "Humpty Dumpty sat on a wall."

sentence = sentence.delete('.').split(' ').reverse().join(' ')

puts sentence