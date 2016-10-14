require_relative('../db/sql_runner')


class Film

  attr_reader :id, :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', '#{@price}') RETURNING * ;"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films ;"
    return Film.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM films where id = #{id} ;"
    film = SqlRunner.run(sql)
    return Film.new(film.first())
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result 
  end

  def self.map_item(sql)
    film = Film.map_items(sql)
    return film.first
  end

end