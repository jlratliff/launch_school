#p6_anagrams.rb

dict = {}

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

words.each do |word|
  scramble = word.split('').sort.join
  if dict.has_key?(scramble)
    dict[scramble].push(word)
  else
    dict[scramble] = [word]
  end
end

dict.each { |entry, words| p words}