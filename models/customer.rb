require_relative('../db/sql_runner')


class Customer

  attr_accessor :id, :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', '#{@funds}') RETURNING * ; "
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def tickets
    sql = "SELECT * FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = #{@id};"
    return Ticket.map_items(sql)
  end

  def count_tickets
    sql = "SELECT * FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = #{@id};"
    return Ticket.map_items(sql).count
  end

  def films
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = #{@id};"
    return Film.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers ;"
    return Customer.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = #{id} ;"
    customer = SqlRunner.run(sql)
    return Customer.new(customer.first())
  end

  def self.delete_all()
    sql = "DELETE FROM customers ;"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    customers = SqlRunner.run(sql)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

  def self.map_item(sql)
    customer = Customer.map_items(sql)
    return customer.first
  end

  def update
    sql = "UPDATE customers SET 
    name = '#{@name}',
    funds = #{@funds}
    WHERE id = #{id} ;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = #{id} ;"
    SqlRunner.run(sql)
  end




end






