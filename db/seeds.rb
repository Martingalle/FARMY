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
  case category
    when "Tractor"
      photo = ["kwcl2tfxqdfb13quybr","imvxgrkpf2p8byiwsrs"].sample
      photo.delete(photo)
    when "Combine Harvester"
      photo = ["vuqbgu4e8knh6xdprfrn"]
    when "Sower"
      photo = ["enpaiffh1vtlfdgpgwpz"]
    when "Sprayer"
      photo = ["nve3asouppu4vldf62tn"]
    when "Shredder"
      photo = ["huarkiih1lilpn7xiabv"]
    when "Spreader"
      photo = ["qzqnyzle6pqot12f55eq"]
    when "Rolls"
      photo = ["j55tpqlilxtqecurqqoz"]
    when "Sidewinder"
      photo = ["glmjyatp0zzd5qbkq2hv"]
    when "Vineyard Tractor"
      photo = ["nhcvwhnu7kmwhnv6czns"]
  ids = User.pluck(:id)
  force_moteur = rand(50..400)
  price= rand(20..200)
  machine = Machine.create!(make: make, location: location, user_id: ids.sample, year:year, category:category, force_moteur:force_moteur, price_per_hour:price, photo:photo)
end

puts 'finished creating the machines'
