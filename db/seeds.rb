# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = open(url).read
ingredients = JSON.parse(drinks)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end


Cocktail.create(name: "Mojito")
Cocktail.create(name: "Caïpirinha")
Cocktail.create(name: "Moscow mule")


