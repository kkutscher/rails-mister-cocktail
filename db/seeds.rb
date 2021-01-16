# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

puts "Cleaning database..."
Ingredient.destroy_all

puts "Creating ingredients..."

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

html_file = open(url).read
ingredients = JSON.parse(html_file)
drinks_list = []

ingredients['drinks'].each do |ingredient|
  drinks_list << ingredient['strIngredient1']
end

puts drinks_list

drinks_list.each do |drink|
  Ingredient.create(name: drink)
end

puts "Finished!"

puts "Cleaning database..."
Cocktail.destroy_all

puts "Creating ingredients..."
Cocktail.create(name: "Mojito")
Cocktail.create(name: "Bloody Mary")
Cocktail.create(name: "Sex on the BEach")

puts "Finished!"
