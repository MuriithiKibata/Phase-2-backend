# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Store.destroy_all
Item.destroy_all

puts "Creating"

user1 = User.create(email: "Micheal", password: "password123", password_confirmation: "password123")
user2 =User.create(email: "Muriithi", password: "mkjr12", password_confirmation: "mkjr12")
user3 = User.create(email: "Israel@gmail.com", password:"Isreal123", password_confirmation: "Isreal123")

store1 = Store.create(name: "MNKStores", user_id: user1.id)
store2 = Store.create(name: "MKStores", user_id: user2.id)


items1 = Item.create(name: "Bread", quantity: 15, price: 60, store_id: store1.id)
items2 = Item.create(name: "Soap", quantity: 10, price: 100, store_id: store1.id)
items3 = Item.create(name: "Blueband", quantity: 25, price: 150, store_id: store1.id)
items4 = Item.create(name: "Shampoo", quantity: 5, price: 600, store_id: store1.id)
items5 = Item.create(name: "Tea-leaves", quantity: 30, price: 160, store_id: store1.id)
items6 = Item.create(name: "Milk", quantity: 95, price: 55, store_id: store1.id)



items1 = Item.create(name: "Bread", quantity: "15pcs", price: 60, store_id: store2.id)
items2 = Item.create(name: "Soap", quantity: 10, price: 100, store_id: store2.id)
items3 = Item.create(name: "Blueband", quantity: 25, price: 150, store_id: store2.id)
items4 = Item.create(name: "Shampoo", quantity: 5, price: 600, store_id: store2.id)

cart1 = Cart.create()


puts "Creation Completed"