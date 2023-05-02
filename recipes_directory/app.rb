require_relative "./lib/database_connection"
require_relative "../lib/recipes_directory"

DatabaseConnection.connect("recipes_directory")

result = DatabaseConnection.exec_params("SELECT * FROM recipes;", [])
recipes_directory = RecipesDirectory.new


# print all recipes 
recipes = recipes_directory.all
recipes.each do |recipe|
  puts "#{recipe.id} - #{recipe.name} - #{recipe.average_cooking_time} - #{recipe.rating}"
end

# Find a specific recipe by ID
recipe = recipes_directory.find(1)
if recipe
  puts "Found recipe: #{recipe.name}"
else
  puts "Recipe not found"
end