require 'faker'

p " ********************************* "
p " *                               * "
p " *         BEGIN OF SEED         * "
p " *                               * "
p " ********************************* "

p "Destroy curent data..."

p "Destroying Category... #{Category.count} "
Category.destroy_all

p "Destroying Item... #{Item.count} "
Item.destroy_all

p "Destroying User... #{User.count} "
User.destroy_all

p "Destroying Cart... #{Cart.count} "
Cart.destroy_all

p "-----------------------"
p "-----------------------"


puts 'test category'
Category.new(name: "classic").save
Category.new(name: "funny").save
Category.new(name: "kitty").save
Category.new(name: "black_cat").save
Category.new(name: "white_cat").save
Category.new(name: "ginger_cat").save
Category.new(name: "black_and_white_cat").save
Category.new(name: "main_coon").save
Category.new(name: "neva").save
Category.new(name: "paws").save
Category.new(name: "cat_head").save

p "Creation Category... #{Category.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"

puts 'test item'
Item.create(title: "Neva", description:"Petit neva qui regarde l'objectif", price: 12.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235460/sqtjxcpxfbavvdfv8k9h.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Rouquin dans les escaliers", description:"Un petit rouquin sournois dans les escaliers", price: 8.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235472/fbv1hoveb0opepanhwya.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Roger", description:"Il essaie de venir voler de la nourriture", price: 52.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235478/nwiicgffpma8aajnptva.jpeg", category_id: Category.all.sample.id)
Item.create(title: "JackJack et sa rose", description:"JackJack fait une sieste avec une rose", price: 9.99, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235481/vkxxtbryqfmkfwcluzbu.jpeg", category_id: Category.all.sample.id)
Item.create(title: "La famille", description:"Rien de plus precieux qu'être en famille", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235485/cv8nltg5ibiwc6omykup.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Film d'horreur", description:"Photo d'un petit chat aussi mignon que terrifie", price: 20.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235489/jilawfokpz6gvb2p7af9.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Dormeur", description:"Ce petit chat sait comment apprecier un samedi apres midi", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235494/vnq6joozbgcxpkzaklvh.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Position calin", description:"ce petit maine coon tout doux tout roux attends quelque chose de vous", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235499/vhrrnoziwnemhondmiki.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Chasseur", description:"à l'affut et n'a peur de rien.", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235506/dev0hsav1tnzz5ritz97.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Le savoir", description:"Le savoir est une arme qui peut-être plus affuté que ses petites griffes", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235511/ekqefly5ituvqhfuisdc.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Tomy", description:"Mais ne serait-ce pas des oiseaux?", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235514/mk7kgvmwqwahbrttixft.jpeg", category_id: Category.all.sample.id)
Item.create(title: "portrait mignon", description:"Ce chat prend la pause rien que pour vous", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235518/ijjuys8jd8fcqq5t7tpc.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Sous les orchidees", description:"Quelle belle compagnie que sont les fleurs", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235522/jxlqsk9rjsenlpnqrn0r.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Spleen", description:"Si l'on pouvait comprendre ses miaulement, Arthur Rimbaud serait un petit joueur", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235531/svhkpvqljfugim9fuupp.jpeg", category_id: Category.all.sample.id)
Item.create(title: "Il vous surveille", description:"Mr Berthier, c'est vous?", price: 14.00, image_url: "http://res.cloudinary.com/dpgagdfhp/image/upload/v1606235536/yticcejd1dcl2fhtesur.jpeg", category_id: Category.all.sample.id)
p "Creation Item... #{Item.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"

puts 'test User'
15.times do
    u = User.new
    u.first_name = Faker::Name.first_name
    u.last_name = Faker::Name.first_name
    u.email = "#{u.first_name}.#{u.last_name}@yopmail.com"
    u.password = "123456"
    u.is_admin = false
    u.save
    c = Cart.new
    c.user_id = u.id
    c.save
end

puts 'admin'

u = User.new
u.first_name = 'admin'
u.last_name = 'admin'
u.email = "adminthpcat@yopmail.com"
u.password = "123456"
u.is_admin = true
u.save
c = Cart.new
c.user_id = u.id
c.save


p "Creation cart... #{Cart.count}"
p "Creation Users... #{User.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"
