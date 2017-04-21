# 1
# def star_method(stars)
#   arr = []
#   stars.each do |star|
#     arr.push(star.upcase)
#   end
#   arr
# end

# stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
# stars_2 = star_method(stars_1)
# p stars_1
# p stars_2

# 2
# def star_method(stars)
#   arr = []
#   counter = 0

#   until counter == stars.size
#     star = stars[counter]
#     arr << star if star.size > 4

#     counter += 1
#   end
#   arr
# end

# stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
# stars_2 = star_method(stars_1)

# p stars_1
# p stars_2

# 3
# def star_method(stars)
#   for star in stars
#     star.downcase
#   end
# end

# stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
# stars_2 = star_method(stars_1)

# p stars_1
# p stars_2

#4
def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size do
    arr << stars[counter][0, 3]

    counter += 1
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

p stars_1
p stars_2