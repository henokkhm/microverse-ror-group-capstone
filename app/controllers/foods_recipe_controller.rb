class FoodsRecipeController < ApplicationController
  def new
    @foods_recipe = FoodsRecipe.new
    @foods = Food.where(user_id: current_user)
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @foods_recipe = FoodsRecipe.new(food_recipe_params)
    @recipe = Recipe.find(params[:recipe_id])
    @foods_recipe.recipe = @recipe

    if @foods_recipe.save
      flash[:notice] = 'Ingredient added successfully!'
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = 'Error adding ingredient.'
      redirect_to recipes_path
    end
  end

  def destroy
    @foods_recipe = FoodsRecipe.find(params[:id])
    if @foods_recipe
      @recipe = @foods_recipe.recipe
      @foods_recipe.destroy
      flash[:notice] = 'Ingredient deleted successfully!'
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = 'Unable to delete ingredient!'
    end
  end

  private

  def food_recipe_params
    params.require(:foods_recipe).permit(:food_id, :quantity)
  end
end
