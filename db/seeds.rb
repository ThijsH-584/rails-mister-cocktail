# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

puts "Wiped Instances"

INGREDIENTS = ["lemon", "ice", "mint leaves", "orange juice"]

INGREDIENTS.each do |ingredient|
	Ingredient.create(name: ingredient)
end

COCKTAILS = ["Mint Julep", "Gonzalo Morning Brew", "Sunny Day", "Leaves From Steves"]

COCKTAILS.each do |cocktail|
	Cocktail.create(name: cocktail)
end

DOSES = ["1 cl", "4 cl", "4 leafes", "2 cl"]


DOSES.each do |dose|
	new_dose = Dose.new(description: dose)
	new_dose.ingredient = Ingredient.all.sample
	new_dose.cocktail = Cocktail.all.sample
	new_dose.save
end

puts "#{Ingredient.count} ingredients created"
puts "#{Cocktail.count} cocktails created"
puts "#{Dose.count} doses created"
