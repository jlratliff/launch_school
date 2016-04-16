def print_uuid
  uuid = ''
  32.times do |index|
    if [8, 12, 16, 20].include? index
      uuid = uuid + '-'
    end
    uuid = uuid + rand(16).to_s(16)
  end
  uuid
end

puts print_uuid