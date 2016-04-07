# Ex14.rb
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
info_fields = [:email, :address, :phone_num]

contacts.each do |name, hash|
  info_fields.each do |field|
    puts field
    hash[field] = contact_data.shift
  end
end

puts contacts