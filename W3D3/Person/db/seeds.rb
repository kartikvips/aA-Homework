# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ranch_house = House.create(house_type: "Ranch House")
beach_house = House.create(house_type: "Beach House")

sarah = People.create(name: "Sarah", color: "blue", house_id: ranch_house.id)
jeff = People.create(name: "Jeff", color: "green", house_id: beach_house.id)

Toy.create(name: "Yarn", people_id: sarah.id)
Toy.create(name: "Squeaker", people_id: sarah.id)
Toy.create(name: "Feather", cat_id: jeff.id)
Toy.create(name: "Bull", cat_id: jeff.id)
