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

makes = ["Massey-Ferguson", "New Holland", "International", "Bobard", "McCormick", "Kobatsu", "Manitou", "John Deere", "Deutz-Fahr", "Someca"]
cities = ["Nevers", "Bourgoin-Jallieu", "Dinard", "Auxerre", "Nantua", "Cassis", "Romorantin-Lanthenay", "Dinard", "Colmar", "Dunkerque" ]

10.times do |machine|
  make = makes.sample
  location = cities.sample
  year = rand(1990..2018)
  category = ["Tractor","Combine Harvester","Sower","Sprayer","Shredder","Spreader","Rolls","Sidewinder","Vineyard Tractor"].sample
  roues_motrices = [2,4].sample
  case category
    when "Tractor"
      photo = ["v1534854305/kwcl2ltfxqdfb13quybr","v1534854269/imvxvgrkpf2p8byiwsrs"].sample
    when "Combine Harvester"
      photo = "v1534854342/vuqbgu4e8knh6xdprfrn"
    when "Sower"
      photo = "v1534854191/enpaiffh1vtlfdgpgwpz"
    when "Sprayer"
      photo = "v1534854627/nve3asouppu4vldf62tn"
    when "Shredder"
      photo = "v1534854296/huarkiih1lilpn7xiabv"
    when "Spreader"
      photo = "v1534854727/qzqnyzle6pqot12f55eq"
    when "Rolls"
      photo = "v1534854620/j55tpqlilxtqecurqqoz"
    when "Sidewinder"
      photo = "v1534854279/glmjyatp0zzd5qbkq2hv"
    when "Vineyard Tractor"
      photo = "v1534853673/nhcvwhnu7kmwhnv6czns"
  end
  ids = User.pluck(:id)
  force_moteur = rand(50..400)
  price = rand(20..200)
  machine = Machine.create!(make: make, location: location, user_id: ids.sample, year:year, category: category, force_moteur:force_moteur, price_per_hour:price, remote_photo_url: "https://res.cloudinary.com/ehrsatz/image/upload/#{photo}.jpg")
end

puts 'finished creating the machines'

puts 'finished creating the machines'
