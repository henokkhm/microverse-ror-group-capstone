class CreateFoodsRecipesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients_recipes, id: false do |t|
      t.belongs_to :ingredient
      t.belongs_to :recipe
      t.integer :quantity

      t.timestamps
    end
  end
end
