require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

# Ticket.delete_all()
# Film.delete_all()
# Customer.delete_all()

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

film1 = Film.new({'title' => 'Bridget Jones''s Baby', 'price' => 12})
film2 = Film.new({'title' => 'Finding Dory', 'price' => 7})
film3 = Film.new({'title' => 'Bad Moms', 'price' => 12})
film4 = Film.new({'title' => 'The BFG', 'price' => 7})
film5 = Film.new({'title' => 'Sausage Party', 'price' => 12})
film5 = Film.new({'title' => 'Kubo', 'price' => 7})







