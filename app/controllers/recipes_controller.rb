class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:name, :description, :cooking_time, :preparation_time, :public).all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:success] = 'Recipe deleted successfully'
    redirect_to recipes_path
  end
end
