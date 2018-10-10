# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Restaurant.destroy_all

Restaurant.create(
capacity: 150,
opening_hours: 12,
closing_hours: 2,
address: "42 Tagliatelle str.",
price_range: 2,
neighbourhood_id: "Etobicoke",
summary: "Your italian food from la nonna",
menu: "Ipse lorem",
category_id: 1,
name: "Little Nero",
picture_url: "https://res.cloudinary.com/simpleview/image/upload/crm/napavalley/HR-azzurro-exterior-credit-Mario-Piombo-b1dd5bb85056a36_88281807-5056-a36a-08a3b32db2fe41f8.jpg")
