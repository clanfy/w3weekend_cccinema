require_relative("../db/sql_runner")

class Ticket

  attr_accessor :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ('#{@customer_id}', '#{@film_id}') RETURNING * ; "
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def self.all()
    sql = "SELECT * from tickets;"
    return Ticket.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM tickets WHERE id = #{id} ;"
    ticket = SqlRunner.run(sql)
    return Ticket.new(ticket.first())
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new(ticket)}
    return result
  end

  def self.map_item(sql)
    ticket = Ticket.map_items(sql)
    return ticket.first
  end

  def update
    sql = "UPDATE tickets SET
    customer_id = #{customer_id}, 
    film_id = #{film_id}
    WHERE id = #{id} ;"
    SqlRunner.run(sql)
  end




end