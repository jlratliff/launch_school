people = { Kate: 27, john: 25, Mike:  18 }
p ((people.sort_by do |name, age|
  age
end).to_h)