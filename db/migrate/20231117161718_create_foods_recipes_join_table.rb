class CreateFoodsRecipesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :foods_recipes, id: false do |t|
      t.belongs_to :food
      t.belongs_to :recipe
      t.integer :quantity

      t.timestamps
    end
  end
end
