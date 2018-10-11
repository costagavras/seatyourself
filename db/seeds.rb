# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Restaurant.destroy_all
Neighbourhood.destroy_all
Category.destroy_all
Reservation.destroy_all

Category.create(
  name: "Italian"
)

Category.create(
  name: "Asian"
)

Category.create(
  name: "Comfort Food"
)

Neighbourhood.create(
  name: "Downtown"
)

Neighbourhood.create(
  name: "East York"
)

Neighbourhood.create(
  name: "Mississauga"
)

Neighbourhood.create(
  name: "Parkdale"
)

  Restaurant.create!(
capacity: 150,
opening_hours: 12,
closing_hours: 2,
address: "42 Tagliatelle str.",
price_range: 2,
neighbourhood_id: 1,
summary: "Your italian food from la nonna",
menu: "Ipse lorem",
category_id: 1,
name: "Little Nero",
picture_url: "https://res.cloudinary.com/simpleview/image/upload/crm/napavalley/HR-azzurro-exterior-credit-Mario-Piombo-b1dd5bb85056a36_88281807-5056-a36a-08a3b32db2fe41f8.jpg")


Restaurant.create!(
capacity: 100,
opening_hours: 12,
closing_hours: 8,
address: "220 King Street West",
price_range: 3,
neighbourhood_id: Neighbourhood.first.id,
summary: "Shitz Binary",
menu: "01010111010101101010101",
category_id: Category.last.id,
name: "Meat Your Maker",
picture_url: "https://res.cloudinary.com/simpleview/image/upload/crm/napavalley/HR-azzurro-exterior-credit-Mario-Piombo-b1dd5bb85056a36_88281807-5056-a36a-08a3b32db2fe41f8.jpg")

Restaurant.create!(
capacity: 50,
opening_hours: 12,
closing_hours: 2,
address: "Square One",
price_range: 3,
neighbourhood_id: Neighbourhood.all.sample.id,
summary: "Fancy Food Stuffs",
menu: "Ipse lorem",
category_id: Category.first.id,
name: "Asian Wok",
picture_url: "https://res.cloudinary.com/simpleview/image/upload/crm/napavalley/HR-azzurro-exterior-credit-Mario-Piombo-b1dd5bb85056a36_88281807-5056-a36a-08a3b32db2fe41f8.jpg")


###Stephen Adding Reservation Seeds###
date_time1 = DateTime.new(2018,10,10,4,50,0)
Reservation.create(date_time: date_time1,
                   party_size: 5,
                   user_id: 1,
                   restaurant_id: 1)

date_time2 = DateTime.new(2018,10,12,4,50,0)
Reservation.create(date_time: date_time2,
                   party_size: 7,
                   user_id: 2,
                   restaurant_id: 2)

date_time3 = DateTime.new(2018,10,11,4,50,0)
Reservation.create(date_time: date_time3,
                   party_size: 7,
                   user_id: 2,
                   restaurant_id: 2)
