# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Neighbourhood.destroy_all
Category.destroy_all
Reservation.destroy_all

# 11 Categories
Category.create(
  name: "Italian"
)

Category.create(
  name: "Asian"
)

Category.create(
  name: "Comfort Food"
)

Category.create(
  name: "BBQ"
)

Category.create(
  name: "Turkish"
)

Category.create(
  name: "Greek"
)

Category.create(
  name: "Canadian"
)

Category.create(
  name: "Mediterranean"
)

Category.create(
  name: "Sea Food"
)

Category.create(
  name: "German"
)

Category.create(
  name: "Vegan"
)

# 5 Toronto neighbourhoods
Neighbourhood.create(
  name: "Downtown"
)

Neighbourhood.create(
  name: "Little Italy"
)

Neighbourhood.create(
  name: "Greektown"
)

Neighbourhood.create(
  name: "Parkdale"
)

Neighbourhood.create(
  name: "Kensington Market"
)

# 20 Retaurants to populate website initial state
Restaurant.create!(
name: "Amico’s Pizza",
capacity: 50,
opening_hours: 16,
closing_hours: 4,
price_range: 2,
address: "1648 Queen St W, Toronto, ON M6R 1B2",
summary: "Long-running Italian eatery with a back patio, serving classic pies, pastas & mains in relaxed digs.",
menu: "https://www.amicospizza.com/menu/",
picture_url: "https://s3.amazonaws.com/btoimage/prism-thumbnails/listings/3a91-20130227-amicos-pizza.jpg-resize_then_crop-_frame_bg_color_FFF-h_1365-gravity_center-q_70-preserve_ratio_true-w_2048_.webp",
category_id: Category.find_by(name: "Italian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Parkdale").id)

Restaurant.create!(
name: "Grand Electric",
capacity: 35,
opening_hours: 12,
closing_hours: 23,
price_range: 2,
address: "1330 Queen St W, Toronto, ON M6K 1L4",
summary: "Hip, bustling space for tacos, tunes & creative Mexican fare at communal tables.",
menu: "http://grandelectrictoronto.com/menu/",
picture_url: "http://4.bp.blogspot.com/-NLtSYB_xtLM/USVY8zlGfWI/AAAAAAAAIvU/0tXh2zDxvMI/s1600/IMGP6003+copy1.jpg",
category_id: Category.find_by(name: "Comfort Food").id,
neighbourhood_id: Neighbourhood.find_by(name: "Parkdale").id)

Restaurant.create!(
name: "Electric Mud",
capacity: 30,
opening_hours: 18,
closing_hours: 23,
price_range: 2,
address: "5 Brock Ave, Toronto, ON M6K 2K3",
summary: "Kitschy BBQ joint offering smoked meats & craft beer, plus rock tunes, picnic tables & a patio.",
menu: "http://electricmudbbq.com/menu/",
picture_url: "https://c1.staticflickr.com/5/4383/37216896635_157db0189c_b.jpg",
category_id: Category.find_by(name: "BBQ").id,
neighbourhood_id: Neighbourhood.find_by(name: "Parkdale").id)

Restaurant.create!(
name: "Guu",
capacity: 40,
opening_hours: 17,
closing_hours: 23,
price_range: 3,
address: "1314 Queen St W, Toronto, ON M6K 1L4",
summary: "Minimally decorated haunt serving up small plates of Japanese eats, plus sake, cocktails & beer.",
menu: "https://guu-izakaya.com/wp-content/uploads/2018/01/TorontMenu201801CDinnerWeb.pdf",
picture_url: "https://s3-media1.fl.yelpcdn.com/bphoto/UEHocwN6ZQmt9uNSKq_Huw/o.jpg",
category_id: Category.find_by(name: "Asian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Parkdale").id)

Restaurant.create!(
name: "Il Fornello",
capacity: 60,
opening_hours: 11,
closing_hours: 21,
price_range: 2,
address: "576 Danforth Ave, Toronto, ON M4K 1R1",
summary: "Seafood, pasta & Neapolitan-style pizza in a bright, modern setting with a spacious patio.",
menu: "https://ilfornello.com/danforth/#1496321154499-1e08fa80-86509d71-4746",
picture_url: "https://scontent.bookenda.com/merchants/il-fornello-danforth/image/c920a6a3-bbb6-4da6-bd2f-05c9837d4c79.jpg",
category_id: Category.find_by(name: "Italian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Greektown").id)

Restaurant.create!(
name: "Mr. Pride",
capacity: 40,
opening_hours: 11,
closing_hours: 22,
price_range: 2,
address: "800 Danforth Ave, Toronto, ON M4J 1L6",
summary: "Eatery for Turkish-style pies topped with ground meats, eggs & other classic ingredients & desserts.",
menu: "http://mrpide.ca/menu/",
picture_url: "https://s3-media1.fl.yelpcdn.com/bphoto/9_MysiUYjk0EyBUZaNAgUQ/ls.jpg",
category_id: Category.find_by(name: "Turkish").id,
neighbourhood_id: Neighbourhood.find_by(name: "Greektown").id)

Restaurant.create!(
name: "Mezes",
capacity: 100,
opening_hours: 11,
closing_hours: 23,
price_range: 3,
address: "456 Danforth Ave, Toronto, ON M4K 1P3",
summary: "Busy Greek spot with a lively vibe & a 2-level dining room, plus share plates & a heated patio.",
menu: "http://www.mezes.com/#menu_catering-menu",
picture_url: "http://www.mezes.com/restaurants/mezes/gallery/2_large.jpg",
category_id: Category.find_by(name: "Greek").id,
neighbourhood_id: Neighbourhood.find_by(name: "Greektown").id)

Restaurant.create!(
name: "Christina's",
capacity: 60,
opening_hours: 11,
closing_hours: 24,
price_range: 2,
address: "492 Danforth Ave, Toronto, ON M4K 1P5",
summary: "Greek & Mediterranean cuisine, plus a live Greek band or weekend belly dancing & a heated patio.",
menu: "http://www.christinas.ca/#menu_brunch",
picture_url: "https://dinehere.ca/sites/default/files/imagecache/restaurant_detail_full/sites/default/files/r_images/175742.jpg",
category_id: Category.find_by(name: "Greek").id,
neighbourhood_id: Neighbourhood.find_by(name: "Greektown").id)

Restaurant.create!(
name: "Trattoria Taverniti",
capacity: 50,
opening_hours: 17,
closing_hours: 22,
price_range: 2,
address: "591 College St, Toronto, ON M6G 1B2",
summary: "Pizzas & pasta dishes are served at this cozy Italian spot with exposed brick & outdoor seats.",
menu: "http://tavernitis.ca/menu.html",
picture_url: "https://image.ibb.co/ivok4v/11247710_848093995246290_924329911984992464_n33.jpg",
category_id: Category.find_by(name: "Italian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Little Italy").id)

Restaurant.create!(
name: "Vivoli",
capacity: 55,
opening_hours: 12,
closing_hours: 23,
price_range: 3,
address: "665 College St, Toronto, ON M6G 1B7",
summary: "Bright space for Italian dishes & traditional thin-crust pizzas, plus ample patio seating.",
menu: "http://www.vivoli.ca/order-online/",
picture_url: "http://canada.lilithezine.com/images/Toronto-Rooftop-Patios-03.jpg",
category_id: Category.find_by(name: "Italian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Little Italy").id)

Restaurant.create!(
name: "Starving Artist",
capacity: 35,
opening_hours: 9,
closing_hours: 18,
price_range: 1,
address: "810 College St, Toronto, ON M6G 1C8",
summary: "Cosy dining room with an assortment of waffles and brunch food.",
menu: "http://www.starvingartistbar.com/food.html",
picture_url: "https://localfoodtours.com/wp-content/uploads/2018/05/starving-artist-little-italy-toronto.jpg",
category_id: Category.find_by(name: "Canadian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Little Italy").id)

Restaurant.create!(
name: "Burgatory",
capacity: 30,
opening_hours: 11,
closing_hours: 10,
price_range: 1,
address: "719 College St, Toronto, ON M6G 1C2",
summary: "Casual & cosy burger shop in Little Italy.",
menu: "http://www.burgatorycanada.com/menu/",
picture_url: "https://media.bizj.us/view/img/3351691/burgatory*750xx1200-677-0-30.jpg",
category_id: Category.find_by(name: "Comfort Food").id,
neighbourhood_id: Neighbourhood.find_by(name: "Little Italy").id)

Restaurant.create!(
name: "Figo",
capacity: 45,
opening_hours: 11,
closing_hours: 23,
price_range: 2,
address: "295 Adelaide St W, Toronto, ON M5V 1P7",
summary: "Contemporary Italian dishes served in a sleek space with soaring windows & an open kitchen.",
menu: "https://figotoronto.com/#menu",
picture_url: "https://www.studiomunge.com/wp-content/uploads/2016/09/Studio-Munge-Figo-01-ED_short-1024x745.jpg",
category_id: Category.find_by(name: "Italian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Downtown").id)

Restaurant.create!(
name: "Montecito",
capacity: 40,
opening_hours: 11,
closing_hours: 24,
price_range: 3,
address: "299 Adelaide St W, Toronto, ON M5V 1P7",
summary: "Farm-To-Table inspired California cuisine menu changes seasonally and highlights the very best in Canadian produce, meats, and seafood.",
menu: "https://www.montecitorestaurant.ca/food-drink/",
picture_url: "http://www.bestoftoronto.net/wp-content/uploads/2014/11/Montecito-UpstairsBar-JohnTan-BestofToronto-2014-009.jpg",
category_id: Category.find_by(name: "Canadian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Downtown").id)

Restaurant.create!(
name: "Byblos",
capacity: 80,
opening_hours: 17,
closing_hours: 23,
price_range: 3,
address: "11 Duncan St, Toronto, ON M5V 3M2",
summary: "Luxe, 2-story restaurant putting a contemporary spin on Eastern Mediterranean cuisine & cocktails.",
menu: "http://byblostoronto.com/#menu",
picture_url: "https://www.blogto.com/listings/restaurants/upload/2014/03/20140313-byblos590-05.jpg",
category_id: Category.find_by(name: "Mediterranean").id,
neighbourhood_id: Neighbourhood.find_by(name: "Downtown").id)

Restaurant.create!(
name: "Kit Kat",
capacity: 30,
opening_hours: 11,
closing_hours: 23,
price_range: 3,
address: "297 King St W, Toronto, ON M5V 1J5",
summary: "Homestyle Southern Italian cooking plus Italian & New World wines in a brick-lined space.",
menu: "http://www.kitkattoronto.com/menus/",
picture_url: "https://media.blogto.com/articles/20180119-kit-kat-hot-or-not.jpg?w=2048&cmd=resize_then_crop&height=1365&quality=70",
category_id: Category.find_by(name: "Italian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Downtown").id)

Restaurant.create!(
name: "Grey Gardens",
capacity: 30,
opening_hours: 17,
closing_hours: 24,
price_range: 3,
address: "199 Augusta Ave, Toronto, ON M5T 2L4",
summary: "Long list of wines & a seafood-heavy menu of small plates & mains served in a relaxed setting.",
menu: "http://greygardens.ca/",
picture_url: "https://media.blogto.com/listings/20170519-greygardens-12.jpg?w=2048&cmd=resize_then_crop&height=1365&quality=70",
category_id: Category.find_by(name: "Sea Food").id,
neighbourhood_id: Neighbourhood.find_by(name: "Kensington Market").id)

Restaurant.create!(
name: "Supermarket",
capacity: 50,
opening_hours: 19,
closing_hours: 2,
price_range: 1,
address: "268 Augusta Ave, Toronto, ON M5T 2L9",
summary: "Casual restaurant & bar offering Asian-fusion small plates plus late-night dancing & concerts.",
menu: "http://www.supermarketto.ca/menu",
picture_url: "https://static1.squarespace.com/static/534d5a3ce4b056d2a338a836/t/53e0124de4b0f775e058572a/1407193718271/112109_dinner_9a.jpg?format=1500w",
category_id: Category.find_by(name: "Canadian").id,
neighbourhood_id: Neighbourhood.find_by(name: "Kensington Market").id)

Restaurant.create!(
name: "Otto's Berlin Doner",
capacity: 20,
opening_hours: 12,
closing_hours: 21,
price_range: 1,
address: "256 Augusta Ave, Toronto, ON M5T 2L9",
summary: "Bright counter-serve with patio serving Berlin-style kebabs & currywurst; open late on weekends.",
menu: "http://ottosdoner.com/",
picture_url: "https://www.postcity.com/images/2015/07-July/ottos-inside1.jpg",
category_id: Category.find_by(name: "German").id,
neighbourhood_id: Neighbourhood.find_by(name: "Kensington Market").id)

Restaurant.create!(
name: "Hibiscus Cafe",
capacity: 30,
opening_hours: 11,
closing_hours: 18,
price_range: 1,
address: "238 Augusta Ave, Toronto, ON M5T 2L7",
summary: "Cozy vegetarian eatery with a patio, offering sweet & savory crêpes, salads & non-dairy ice cream.",
menu: "http://hibiscuscafe.ca/#menu",
picture_url: "http://jpress.journalism.ryerson.ca/munchoutto/files/2013/10/DSC05177.jpg",
category_id: Category.find_by(name: "Vegan").id,
neighbourhood_id: Neighbourhood.find_by(name: "Kensington Market").id,
user_id: User.first)


###Stephen Adding Reservation Seeds###
date_time1 = DateTime.new(2018,10,10,4,50,0)
Reservation.create(
  date_time: date_time1,
  party_size: 5,
  user_id: User.first.id,
  restaurant_id: Restaurant.first.id
)

date_time2 = DateTime.new(2018,10,12,4,50,0)
Reservation.create(
  date_time: date_time2,
  party_size: 7,
  user_id: User.first.id,
  restaurant_id: Restaurant.first.id
)

date_time3 = DateTime.new(2018,10,11,4,50,0)
Reservation.create(
  date_time: date_time3,
  party_size: 7,
  user_id: User.first.id,
  restaurant_id: Restaurant.first.id
)
