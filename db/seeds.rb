require_relative '../models/student'
require_relative '../models/house'

House.delete_all
gryffindor = House.new(
  'name' => 'Gryffindor',
  'logo_url' => 'https://cdn.shopify.com/s/files/1/0006/8213/1492/products/Gryffindor_Hogwarts_House_Crest_-_Harry_Potter_1024x1024.jpg'
)
gryffindor.save
ravenclaw = House.new(
  'name' => 'Ravenclaw',
  'logo_url' => 'https://cdn.shopify.com/s/files/1/0006/8213/1492/products/Ravenclaw_Hogwarts_House_Crest_-_Harry_Potter_1024x1024.jpg'
)
ravenclaw.save
hufflepuff = House.new(
  'name' => 'Hufflepuff',
  'logo_url' => 'https://cdn.shopify.com/s/files/1/0006/8213/1492/products/hufflepuff_1024x1024.jpg'
)
hufflepuff.save
slytherin = House.new(
  'name' => 'Slytherin',
  'logo_url' => 'https://cdn.shopify.com/s/files/1/0006/8213/1492/products/Slytherin_Hogwarts_House_Crest_-_Harry_Potter_1024x1024.jpg'
)
slytherin.save

Student.delete_all
harry = Student.new(
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house_id' => gryffindor.id,
  'age' => 20
)
harry.save

ron = Student.new(
  'first_name' => 'Ron',
  'last_name' => 'Weasley',
  'house_id' => gryffindor.id,
  'age' => 20
)
ron.save
