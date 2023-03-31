# recipes Model and Repository Classes Design Recipe

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- (file: spec/seeds_recipes.sql)

TRUNCATE TABLE recipes RESTART IDENTITY;

INSERT INTO recipes ("name", "avg_cooking_time", "rating") VALUES
('Curry', 90, 4),
('Daal', 60, 3),
('Salad', 15, 2),
('Lasagne', 120, 5);

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 recipes_directory_test < seeds_recipes.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# Table name: recipes

# Model recipes
# (in lib/recipe.rb)
class Recipe
end

# Repository class
# (in lib/recipe_repository.rb)
class RecipeRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# Table name: recipes

# Model class
# (in lib/recipe.rb)

class Recipe

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :avg_cooking_time, :rating
end

```

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# Table name: recipes

# Repository class
# (in lib/recipe_repository.rb)

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM recipes;

    # Returns an array of Recipe objects.
  end

  # Gets a single record by its title
  # One argument: the name (string)
  def find(name)
    # Executes the SQL query:
    # SELECT id, title, author_name FROM recipes WHERE name = $1;

    # Returns an array containg a single Recipe object.
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# 1
# Get all recipes

repo = RecipeRepository.new

recipes = repo.all

recipes.length # =>  4

recipes[0].id # =>  1
recipes[0].name # =>  'Curry'
recipes[0].avg_cooking_time # =>  '90'

recipes[2].id # =>  3
recipes[2].title # =>  'Salad'
recipes[2].rating # =>  '2'

# 2
# Find a single recipe
repo = RecipeRepository.new
recipe = repo.find("Lasange")
recipe.first.id # =>  '4'
recipe.first.name # =>  'Lasange'
recipe.first.rating # =>  '5'

# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby

# file: spec/recipe_repository_spec.rb

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
