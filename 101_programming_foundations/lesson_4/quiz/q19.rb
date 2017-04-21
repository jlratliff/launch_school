countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}

# 1
# p countries_and_capitals.select { |_, country| country[0] == 'B' }

# 2
# p (countries_and_capitals.each_with_object({}) do |(k, v), obj|
#   obj[k] = v if k.chr == 'B'
# end)

# 3
# def select_countries(hsh)
#   sub_set = {}
#   hsh.each_key do |country|
#     if country[0] == 'B'
#       sub_set[country] = hsh[country]
#     end
#   end
#   sub_set
# end

# p select_countries(countries_and_capitals)

# 4
def begins_with_b(string)
  string[0] == 'B'
end

p (countries_and_capitals.find_all do |country, capital|
  begins_with_b(country)
end)