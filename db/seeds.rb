# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CustomersSubscription.destroy_all
Customer.destroy_all
Subscription.destroy_all

edgar = Customer.create({first_name: "Edgar", last_name: "Figaro", email: "edgar@ffvi.com", address: "1234 Figaro"}) 
sabin = Customer.create({first_name: "Sabin", last_name: "Figaro", email: "sabin@ffvi.com", address: "1234 Figaro"}) 
celes = Customer.create({first_name: "Celes", last_name: "Chere", email: "celes@ffvi.com", address: "1234 Tzen"}) 
terra = Customer.create({first_name: "Terra", last_name: "Branford", email: "terra@ffvi.com", address: "1234 Narshe"}) 
gau = Customer.create({first_name: "Gau", last_name: "Lynx", email: "gau@ffvi.com", address: "1234 Mobliz"})

try_tea = Subscription.create({title: "Try Tea", price: 30, frequency: 30})
more_tea = Subscription.create({title: "More Tea, Please", price: 50, frequency: 30})
tea_tea = Subscription.create({title: "Tea, Tea, TEA!!", price: 100, frequency: 30})


CustomersSubscription.create!([
  {customer_id: edgar.id , subscription_id: tea_tea.id , status: 0  },
  {customer_id: edgar.id, subscription_id: more_tea.id, status: 1  },
  {customer_id: sabin.id, subscription_id: more_tea.id, status: 0 },
  {customer_id: celes.id, subscription_id: more_tea.id, status: 1  },
  {customer_id: celes.id, subscription_id: try_tea.id, status: 1 },
  {customer_id: terra.id, subscription_id: try_tea.id, status: 0 },
  {customer_id: gau.id, subscription_id: tea_tea.id, status: 1 },
  {customer_id: gau.id, subscription_id: more_tea.id, status: 1 },
  {customer_id: gau.id, subscription_id: try_tea.id, status: 1 }
])
