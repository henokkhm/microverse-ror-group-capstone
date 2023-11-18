class RecipesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.where(user_id: current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods_recipe = @recipe.foods_recipes.includes(:food)
  end

  def create
    @recipe = Recipe.new(new_recipe)
    @recipe.user = current_user

    if @recipe.save
      flash[:notice] = 'New recipe added!'
      redirect_to recipes_path
    else
      flash[:alert] = "Error! #{@recipe.errors.full_messages.join(', ')}"
      redirect_to new_recipe_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to recipes_path, notice: 'Recipe updated successfully!'
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

  private

  def new_recipe
    params.require(:recipe).permit(:name, :cooking_time, :preparation_time, :description)
  end
end
