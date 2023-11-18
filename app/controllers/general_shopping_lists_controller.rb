class GeneralShoppingListsController < ApplicationController
  def index
    # 1. Get all the recipes of the current user
    users_recipes = Recipe.where(user_id: current_user)

    # 2. Figure out the food items that need to be bought
    food_required_for_all_recipes = Hash.new(0)

    users_recipes.each do |recipe|
      recipe.foods.each do |food|
        food_required_for_all_recipes[food] += recipe.foods_recipes.find_by(food_id: food.id).quantity
      end
    end

    # 3. Compute items that need to be bought,
    # For each food, we want the food name, quantity, and total price
    @foods_to_buy = []

    food_required_for_all_recipes.each do |current_food, required_quantity|
      available_quantity = current_food.quantity

      next unless required_quantity > available_quantity

      @foods_to_buy << {
        food_name: current_food.name,
        quantity_to_buy: "#{required_quantity - available_quantity} #{current_food.measurement_unit}",
        total_price: (required_quantity - available_quantity) * current_food.price
      }
    end

    @grand_total = @foods_to_buy.sum { |food| food[:total_price] }
  end
end
