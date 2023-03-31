require 'pg'
require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it "gets all recipes in the table" do
    repo = RecipeRepository.new
    recipes = repo.all
    expect(recipes.length).to eq 4
    expect(recipes[0].id).to eq '1'
    expect(recipes[0].name).to eq 'Curry'
    expect(recipes[0].avg_cooking_time).to eq '90'
    expect(recipes[2].id).to eq '3'
    expect(recipes[2].title).to eq 'Salad'
    expect(recipes[2].rating).to eq '2'
  end

end