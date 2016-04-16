munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

sum_male_ages = 0
munsters.each_value do |munster|
  sum_male_ages += munster["age"] if munster["gender"] == "male"
end

puts sum_male_ages