# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    user1 = User.create!(username: "Shaun1234", email: "shaun1234@awesomeguy.com", password: "password", role: 1)
#  User.create!(username: "Steve1234", email: "steve1234@awesomeguy.com", password: "password", role: 1)
    user2 = user1.friends.create!(username: "Steve1234", email: "steve1234@awesomeguy.com", password: "password", role: 1)
