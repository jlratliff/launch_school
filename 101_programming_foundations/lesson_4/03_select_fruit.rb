# 03_select_fruit.rb
def select_fruit(hash)
  select_elements = {}
  for key in hash.keys
    select_elements[key] = hash[key] if hash[key] == 'Fruit'
  end
  select_elements
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce)