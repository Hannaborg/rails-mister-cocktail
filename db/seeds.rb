# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'
Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
response = RestClient.get(url)
json = JSON.parse(response)
ingredients = json["drinks"]
ingredients.each do |ingredient|
  ingredient = Ingredient.create(name: ingredient['strIngredient1'])
  p ingredient
end
