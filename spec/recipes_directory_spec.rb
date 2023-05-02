require "recipes_directory"

def reset_recipes_table
    seed_sql = File.read("spec/seeds_recipes_directory.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "recipes_directory_test" })
    connection.exec(seed_sql)
  end
  
  describe RecipesDirectory do
    before(:each) do
      reset_recipes_table
    end
  
    describe "#find" do
      it "returns the recipe with the given ID" do
        repo = RecipesDirectory.new
  
        recipe = repo.find(1)
  
        expect(recipe.id).to eq "1"
        expect(recipe.name).to eq "Maggi special"
        expect(recipe.average_cooking_time).to eq "20"
      end
  
      it "returns nil when no recipe is found with the given ID" do
        repo = RecipesDirectory.new
  
        recipe = repo.find(999)
  
        expect(recipe).to be_nil
      end
    end
  
    def all
      connection = PG.connect(host: "127.0.0.1", dbname: "recipes_directory_test")
      result = connection.exec("SELECT * FROM recipes")
  
      result.map do |row|
        Recipes.new(row["id"], row["name"], row["average_cooking_time"], row["rating"])
      end
    end
  end
  