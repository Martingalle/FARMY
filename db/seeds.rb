# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'starting to populate the db'

50.times do |user|
  name= Faker::Name.name
  email= Faker::Internet.email
  password= Faker::Internet.password
  user = User.create!(name: name, email: email, password: password)


  
end

puts 'created all users'

puts 'creating machines'

10.times do |machine|
  makes = ["Massey-Ferguson", "New Holland", "International", "Bobard", "McCormick", "Kobatsu", "Manitou", "John Deere", "Deutz-Fahr", "Someca"]
  make = makes.sample
  makes.delete(make)
  cities = ["Nevers", "Bourgoin-Jallieu", "Dinard", "Auxerre", "Nantua", "Cassis", "Romorantin-Lanthenay", "Dinard", "Colmar", "Dunkerque" ]
  location = cities.sample
  cities.delete(location)
  year = rand(1990..2018)
  categories = ["Tractor","Combine Harvester","Sower","Sprayer","Shredder","Spreader","Rolls","Sidewinder","Vineyard tractor"]
  roues_motrices = [2,4].sample
  category = categories.sample
  ids = User.pluck(:id)
  force_moteur = rand(50..400)
  price= rand(20..200)
  machine = Machine.create!(make: make, location: location, user_id: ids.sample, year:year, category:category, force_moteur:force_moteur, price_per_hour:price)
end

puts 'finished creating the machines'
