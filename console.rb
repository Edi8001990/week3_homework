require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')
require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()



customer1 = Customer.new({'name' => 'John Smith', 'funds' => 70})
customer2 = Customer.new({'name' => 'Matthew Taylor', 'funds' => 150})
customer3 = Customer.new({'name' => 'Peter McGregor', 'funds' => 100})
customer1.save()
customer2.save()
customer3.save()



film1 = Film.new({'title' => 'Casino Royale', 'price' => 10})
film2 = Film.new({'title' => 'Logan', 'price' => 30})
film3 = Film.new({'title' => 'Iron Man 3', 'price' => 40})
film1.save()
film2.save()
film3.save()



ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket4 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket5 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket6 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket7 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()
ticket7.save()




binding.pry
nil
