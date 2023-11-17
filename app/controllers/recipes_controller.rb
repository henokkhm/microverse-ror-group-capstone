class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.where(user_id: current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.where(user_id: @recipe.user_id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:notice] = 'Recipe deleted successfully!'
    redirect_to recipes_path
  end

  def public_recipes
    @recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
  end
end
