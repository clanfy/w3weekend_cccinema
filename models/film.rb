require_relative('../db/sql_runner')


class Film

  attr_accessor :id, :title, :price

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

  def tickets
    sql = "SELECT * FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.film_id = #{@id}; "
    return Ticket.map_items(sql)
  end

  def count_tickets
    sql = "SELECT * FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.film_id = #{@id}; "
    return Ticket.map_items(sql).count
  end

  def popular_time
    sql = 
    "SELECT * 
     FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.film_id = #{@id} 
     GROUP BY start_time 
     ORDER BY COUNT(*) DESC LIMIT 1; "
    return SqlRunner.run(sql)
  end

  # def popular_time
  #   sql = 
  #   "SELECT start_time 
  #    FROM tickets 
  #    GROUP BY start_time 
  #    ORDER BY COUNT(*) DESC LIMIT 1 FROM 
  #    films INNER JOIN tickets ON tickets.film_id = films_id WHERE tickets.film_id = #{@id}; "
  #   return Ticket.map_items(sql)
  # end


  def customers
    sql = "SELECT * FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = #{@id}; "
    return Customer.map_items(sql)
  end

  def count_customers
    sql = "SELECT * FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.film_id = #{@id}; "
    return Customer.map_items(sql).count
  end


  def self.all()
    sql = "SELECT * FROM films ;"
    return Film.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = #{id} ;"
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

  def update
    sql = "UPDATE films SET
    title = '#{title}',
    price = '#{@price}'
    WHERE id = #{id} ; "
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM films WHERE id = #{id} ; "
    SqlRunner.run(sql)
  end




end