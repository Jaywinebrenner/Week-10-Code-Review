# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.destroy_all
Review.destroy_all

countries = ["USA", "Italy", "Cambodia", "Iceland", "Indonesia", "Chad", "Mozambique", "Lesotho", "Jim Varney World", "Freddy Kruegar Kingdom", "Spain", "India", "Argentina", "Toilet Land", "Bolivia"]

50.times do |index|
  Product.create!(name: Faker::Food.dish,
    cost: rand(1..500),
    country_of_origin: countries.sample)
  end

  p "Created #{Product.count} products for Mario"

  seeded_ids = []
  Product.all.each do |product|
    seeded_ids.push(product.id)
  end

  250.times do |index|
    Review.create!(author: Faker::GreekPhilosophers.name,
      content_body: Faker::Lorem.characters(number: 100),
      rating: rand(1..5),
      product_id: seeded_ids.sample)
    end

    p "Created #{Review.count} reviews for Mario's products"
