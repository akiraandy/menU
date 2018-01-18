require 'faker'
Item.delete_all
Category.delete_all
Menu.delete_all

lunch_menu = Menu.create!(name: "Lunch")
dinner_menu = Menu.create!(name: "Dinner")

Category.create!(name: "appetizers")
Category.create!(name: "entrees")
Category.create!(name: "sides")
Category.create!(name: "desserts")

7.times do 
    item = Item.create!(name: Faker::Lorem.characters(10), description: Faker::Food.description, price: Faker::Commerce.price, active_status: true)
    menu = Menu.all.sample
    menu_item = MenuItem.new(item: item, category: Category.all.sample) 
    menu_item.menus << menu
    menu_item.save
end

7.times do
    item = Item.create!(name: Faker::Lorem.characters(10), description: Faker::Food.description, price: Faker::Commerce.price, DotW: rand(7), daily_special_status: true, active_status: true)
    menu = Menu.all.sample
    menu_item = MenuItem.new(item: item, category: Category.all.sample) 
    menu_item.menus << menu
    menu_item.save
end

User.create!(email: "user@site.com", password: "password", admin: true)