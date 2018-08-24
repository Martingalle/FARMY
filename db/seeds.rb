# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'starting to populate the db'

Machine.destroy_all
Booking.destroy_all
User.destroy_all

50.times do |user|
  name= Faker::Name.name
  email= Faker::Internet.email
  password= "qwerty"
  photo = ["v1535031320/xrisehr0xpwyngpw5zw9",  "v1535031316/sswi3yzreldzlserzt82",
    "v1535031313/shiyyudanpgwqovf7fgo",
    "v1535031308/dloyy6xwknfjj5xxnaim",
    "v1535031303/z4oamyvdyidsdj6hq8mf",
    "v1535031298/im7xrocdw09wqq9sjpkw",
    "v1535031143/kecirzqan7zesruvuadr",
    "v1535031136/rahlummkvm3olrlbj9le",
    "v1535031123/lj8kjg1nl3cx9iazbuwg",
    "v1535031109/v0kosb76pzvrrsrm2uao",
    "v1535031104/wzc0oxydmi1amxe1jrgn",
    "v1535031090/imnp46lcvho5yvp52ego",
    "v1535031083/b4x373nholhrwv4iuf8t",
    "v1535031078/ujaavlhmwxjkdbtkxlgb",
    "v1535031071/ze1nsklu52qfltscqnpc"].sample
  user = User.create!(name: name, email: email, password: password, remote_photo_url: "https://res.cloudinary.com/ehrsatz/image/upload/#{photo}.jpg")
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
  description = "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Fugit quia necessitatibus beatae in aliquam tenetur quidem ea non eligendi numquam doloremque ut molestias, accusamus modi voluptates nemo dolor aperiam commodi.
  Ullam nostrum iusto quibusdam a debitis quae velit minima eum. Iure, at quia dolor quos provident quae incidunt recusandae quis vel officia accusamus facilis alias id tenetur aperiam, culpa repellendus.
  Architecto nam excepturi eaque cumque ipsum libero nobis fugit culpa, nemo, expedita rem voluptas. Eaque, laudantium? Quam saepe optio porro animi ea numquam delectus tempore reiciendis corrupti, cum, repudiandae voluptatibus."
  minHours = rand(5..24)
  force_moteur = rand(50..400)
  roues_motrices = [2,4].sample
  price = rand(20..200)
  machine = Machine.create!(make: make, location: location, user_id: ids.sample, year:year, category: category, force_moteur:force_moteur, price_per_hour:price, remote_photo_url: "https://res.cloudinary.com/ehrsatz/image/upload/#{photo}.jpg", description: description, min_hours:minHours, roues_motrices: roues_motrices)
end

puts 'finished creating the machines'

puts 'starting to create bookings'

20.times do |booking|
  ids = User.pluck(:id)
  price = rand(100..2000)
  machineId = Machine.pluck(:id)
  duration = rand(2..48)
  booking = Booking.create!(machine_id: machineId.sample, price: price, user_id: ids.sample, duration: duration)
end

puts 'finished creating bookings'
