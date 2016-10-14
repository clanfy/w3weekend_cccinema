require_relative('../db/sql_runner')


class Customer

  attr_reader :id, :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = funds['funds'].to_i
  end


end