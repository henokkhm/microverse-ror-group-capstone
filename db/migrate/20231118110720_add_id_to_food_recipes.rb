class AddIdToFoodRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :foods_recipes, :id, :primary_key
  end
end
