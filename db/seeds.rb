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

Customer.create([
  {first_name: "Edgar", last_name: "Figaro", email: "edgar@ffvi.com", address: "1234 Figaro", subscription: true}, 
  {first_name: "Sabin", last_name: "Figaro", email: "sabin@ffvi.com", address: "1234 Figaro", subscription: true}, 
  {first_name: "Celes", last_name: "Chere", email: "celes@ffvi.com", address: "1234 Tzen", subscription: false}, 
  {first_name: "Terra", last_name: "Branford", email: "terra@ffvi.com", address: "1234 Narshe", subscription: true}, 
  {first_name: "Gau", last_name: "Lynx", email: "gau@ffvi.com", address: "1234 Mobliz", subscription: false}, 
])

Subscription.create([
  {title: "Try Tea", price: 30, frequency: 30},
  {title: "More Tea, Please", price: 50, frequency: 30},
  {title: "Tea, Tea, TEA!!", price: 100, frequency: 30},
])
