require_relative '../db/sql_runner'

class House
  attr_reader :id, :name, :logo_url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo_url = options['logo_url']
  end

  def save
    sql = '
    INSERT INTO houses
    (name, logo_url)
    VALUES ($1, $2)
    RETURNING ID'
    values = [@name, @logo_url]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.find(id)
    sql = '
    SELECT * FROM houses
    WHERE id = $1'
    results = SqlRunner.run(sql, [id])
    return House.new(results.first) unless results.count.zero?
    return nil
  end

  def self.all
    sql = 'SELECT * FROM houses'
    results = SqlRunner.run(sql)
    results = results.map { |h| House.new(h) }
    return results
  end

  def self.delete_all
    sql = 'DELETE FROM houses'
    SqlRunner.run(sql)
  end
end
