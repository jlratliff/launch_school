# regex.rb
def hasLab(string)
  if string =~ /lab/
    puts ("#{string} contains 'lab'")
  else
    puts ("Sorry, 'lab' not found in #{string}.")
  end
end

hasLab('laboratory')
hasLab('experiment')
hasLab('Pans Labyrinth')
hasLab('elaborate')
hasLab('polar bear')