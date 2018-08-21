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
  name = makes.sample
  makes.delete(name)
  cities = ["Nevers", "Bourgoin-Jallieu", "Dinard", "Auxerre", "Nantua", "Cassis", "Romorantin-Lanthenay", "Dinard", "Colmar", "Dunkerque" ]
  location = cities.sample
  cities.delete(location)
  ids = User.pluck(:id)
  machine = Machine.create!(name: name, location: location, user_id: ids.sample)
end
puts 'finished creating the machines'
