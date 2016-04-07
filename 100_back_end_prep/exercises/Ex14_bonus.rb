# Ex14_bonus.rb
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
info_fields = [:email, :address, :phone_num]

contacts.each_with_index do |(name, hash), index|
  info_fields.each do |field|
    puts field
    hash[field] = contact_data[index].shift
  end
end

puts contacts