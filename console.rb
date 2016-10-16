require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Cookie', 'funds' => 50})
customer1.save()
customer2 = Customer.new({'name' => 'Martin', 'funds' => 60})
customer2.save()
customer3 = Customer.new({'name' => 'Roko', 'funds' => 30})
customer3.save()
customer4 = Customer.new({'name' => 'Buddy', 'funds' => 70})
customer4.save()
customer5 = Customer.new({'name' => 'Dennis', 'funds' => 40})
customer5.save()

film1 = Film.new({'title' => 'Bridget Jones Baby', 'price' => 12})
film1.save()
film2 = Film.new({'title' => 'Finding Dory', 'price' => 7})
film2.save()
film3 = Film.new({'title' => 'Bad Moms', 'price' => 12})
film3.save()
film4 = Film.new({'title' => 'The BFG', 'price' => 7})
film4.save()
film5 = Film.new({'title' => 'Sausage Party', 'price' => 12})
film5.save()
film6 = Film.new({'title' => 'Kubo', 'price' => 7})
film6.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id, 'start_time' => '17:15'})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id, 'start_time' => '17:00'})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id, 'start_time' => '17:15'})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id, 'start_time' => '12:00'})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film5.id, 'start_time' => '13:00'})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film5.id, 'start_time' => '13:00'})
ticket6.save()
ticket7 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film6.id, 'start_time' => '17:15'})
ticket7.save()
ticket8 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id, 'start_time' => '17:15'})
ticket8.save()
ticket9 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id, 'start_time' => '20:15'})
ticket9.save()
ticket10 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film4.id, 'start_time' => '13:00'})
ticket10.save()


binding.pry
nil








