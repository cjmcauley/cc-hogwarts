require_relative '../db/sql_runner'

class Student
  attr_reader :id, :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save
    sql = '
    INSERT INTO students
    (first_name, last_name, house, age)
    VALUES ($1, $2, $3, $4)
    RETURNING ID'
    values = [@first_name, @last_name, @house, @age]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.find(id)
    sql = '
    SELECT * FROM students
    WHERE id = $1'
    results = SqlRunner.run(sql, [id])
    return Student.new(results.first) unless results.count.zero?
    return nil
  end

  def self.all
    sql = 'SELECT * FROM students'
    result = SqlRunner.run(sql)
    return result.to_a
  end

  def self.delete_all
    sql = 'DELETE FROM students'
    SqlRunner.run(sql)
  end
end
