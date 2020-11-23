require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.new(name: "classic").save              #0
Category.new(name: "funny").save                #1
Category.new(name: "kitty").save                #2
Category.new(name: "black_cat").save            #3
Category.new(name: "white_cat").save            #4
Category.new(name: "ginger_cat").save           #5
Category.new(name: "black_and_white_cat").save  #6
Category.new(name: "main_coon").save            #7
Category.new(name: "neva").save                 #8
Category.new(name: "paws").save                 #9
Category.new(name: "cat_head").save             #10


Item.new(title: "Neva", description:"petit neva qui regarde l'objectif", price: 12000.00, image_url: "/pictures/kitty1.jpg", category_id: 8)
Item.new(title: "rouquin dans les escaliers", description:"un petit rouquin sournois dans les escaliers", price: 8.00, image_url: "/pictures/kitty2.jpg", category_id: 5)
Item.new(title: "roger", description:"il essaie de venir voler de la nourriture", price: 52.00, image_url: "/pictures/kitty3.jpg", category_id: 0)
Item.new(title: "JackJack et sa rose", description:"JackJack fait une sieste avec une rose", price: 9.99, image_url: "/pictures/kitty4.jpg", category_id: 4)
Item.new(title: "La famille", description:"rien de plus precieux qu'etre en famille", price: 14.00, image_url: "/pictures/kitty5.jpg", category_id: 8)
Item.new(title: "Film d'horreur", description:"photo d'un petit chat aussi mignon que terrifie", price: 20.00, image_url: "/pictures/kitty6.jpg", category_id: 9)
Item.new(title: "Dormeur", description:"ce petit chat sait comment apprecier un samedi apres midi", price: 14.00, image_url: "/pictures/kitty7.jpg", category_id: 9)
Item.new(title: "Position calin", description:"ce petit maine coon tout doux tout roux attends quelque chose de vous", price: 14.00, image_url: "/pictures/kitty8.jpg", category_id: 7)
Item.new(title: "chasseur", description:"a l'affut et n'a peur de rien.", price: 14.00, image_url: "/pictures/kitty9.jpg", category_id: 0)
Item.new(title: "Le savoir", description:"Le savoir est une arme qui peut-etre plus affute que ses petites griffes", price: 14.00, image_url: "/pictures/kitty10.jpg", category_id: 7)
Item.new(title: "Tomy", description:"mais ne serait-ce pas des oiseaux?", price: 14.00, image_url: "/pictures/kitty11.jpg", category_id: 0)
Item.new(title: "portrait mignon", description:"ce chat prend la pause rien que pour vous", price: 14.00, image_url: "/pictures/kitty12.jpg", category_id: 0)
Item.new(title: "sous les orchidees", description:"quelle belle compagnie qu sont les fleurs", price: 14.00, image_url: "/pictures/kitty13.jpg", category_id: 0)
Item.new(title: "spleen", description:"si l'on pouvait comprendre ses miaulement, Arthur Rimbaud serait un petit joueur", price: 14.00, image_url: "/pictures/kitty14.jpg", category_id: 0)
Item.new(title: "Il vous surveille", description:"Mr Berthier, c'est vous?", price: 14.00, image_url: "/pictures/kitty15.jpg", category_id: 0)

#user faker

15.times do
    u = User.new
    u.first_name = Faker::Name.first_name
    u.last_name = Faker::Name.first_name
    u.email = "#{u.first_name}.#{u.last_name}@gmail.com"
    u.password = "123456"
    u.is_admin = false
    u.avatar = ""
end


=begin
    
title
description
price
image_url
category_id
    
=end