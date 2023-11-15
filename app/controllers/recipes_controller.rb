class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.where(user_id: @recipe.user_id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:success] = 'Recipe deleted successfully!'
    redirect_to recipes_path
  end
end
