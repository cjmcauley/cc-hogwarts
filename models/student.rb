require_relative '../db/sql_runner'
require_relative 'house'

class Student
  attr_reader :id, :first_name, :last_name, :house_id, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save
    sql = '
    INSERT INTO students
    (first_name, last_name, house_id, age)
    VALUES ($1, $2, $3, $4)
    RETURNING ID'
    values = [@first_name, @last_name, @house_id, @age]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def house
    sql = '
    SELECT * FROM houses
    WHERE id = $1'
    results = SqlRunner.run(sql, [@house_id])
    return House.new(results.first)
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
    results = SqlRunner.run(sql)
    results = results.map { |s| Student.new(s) }
    return results
  end

  def self.delete_all
    sql = 'DELETE FROM students'
    SqlRunner.run(sql)
  end
end
