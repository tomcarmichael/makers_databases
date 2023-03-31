require_relative 'database_connection'
require_relative 'recipe'


class RecipeRepository
  def all
    # Executes the SQL query:
    rows = DatabaseConnection.exec_params('SELECT * FROM recipes;', [])
    recipes = []
    rows.each do |row|
      recipe = Recipe.new
      recipe.id = row['id']
      recipe.name = row['name']
      recipe.avg_cooking_time = row['avg_cooking_time']
      recipe.rating = row['rating']
      recipes << recipe
    end
    
    return recipes
  end

  def find(name)
    # Executes the SQL query:
    # SELECT id, title, author_name FROM recipes WHERE name = $1;

    # Returns an array containg a single Recipe object.
  end
end