# require 'destinations'

class Seed

  def self.begin

    @seed = Seed.new
    @seed.generate_destinations
  end

  def generate_destinations
    20.times do |i|
      destination = Destination.create!(
        country: Faker::Address.country,
        city: Faker::Address.city
      )
      5.times do |i|
        author = Faker::Name.middle_name
        review = Review.create!(destination_id: destination.id, author: author, content: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10))
      puts "Destination #{i}: Country is #{destination.country} and city is '#{destination.city}'."
      p "created #{Review.count} Reviews"
    end
  end
end
end
Seed.begin
#
#

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ author: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# Product.destroy_all
# #
# 50.times do
#   name = Faker::Games::Pokemon.name
#   description = Faker::Lorem.paragraph(12)
#   product = Product.create!(name: name, cost: 1, country: "USA")
#   5.times do
#     name = Faker::Games::Pokemon.name
#     review = Review.new(name: name, body: 1289038901238129803189023890129038901238901293801298039801238901283901298038901238992388901289013980328902389032890, rating: 1)
#     review.product = product
#     review.save!
#   end
# end
#
#   p "created #{Product.count} Pokemon"
