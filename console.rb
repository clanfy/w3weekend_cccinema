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


