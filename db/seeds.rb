# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

400.times do
  username = Faker::Name.name
  Customer.create!(first_name: username, login: username, password: "password")
end

5.times do
  Category.create!(name: Faker::Commerce.department(1, true))
end

15.times do
  Item.create!(name: Faker::Commerce.material)
end

item_ids = Item.pluck(:id)
category_ids = Category.pluck(:id)
30.times do
  p = Product.create(category_id: category_ids.sample, name: Faker::Book.title, price: Faker::Commerce.price)
  item_ids.sample(rand(5) + 2).each do |item_id|
    p.product_items.create!(item_id: item_id, quantity: (rand(10) + 1) )
  end
end

product_ids = Product.pluck(:id)
statuses = Order.statuses.values
customer_ids = Customer.pluck(:id)
200.times do
  created_datetime = Faker::Time.between(6.weeks.ago, DateTime.now)
  Order.create!(customer_id: customer_ids.sample, product_id: product_ids.sample, status: statuses.sample, created_at: created_datetime, updated_at: created_datetime)
end
