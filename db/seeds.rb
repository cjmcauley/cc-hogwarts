require_relative '../models/student'

harry = Student.new(
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house' => 'Gryffindor',
  'age' => 20
)
harry.save

ron = Student.new(
  'first_name' => 'Ron',
  'last_name' => 'Weasley',
  'house' => 'Gryffindor',
  'age' => 20
)
ron.save


Student.all