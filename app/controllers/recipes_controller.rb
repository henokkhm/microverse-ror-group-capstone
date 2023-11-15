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
    flash[:success] = 'Recipe deleted successful'
    redirect_to recipes_path
  end

  describe 'DELETE /recipes/:id' do
    let(:user) { User.create(name: 'tom') }
    let(:recipe) { Recipe.create(name: 'Carrot soup', preparation_time: '12 mins', cooking_time: '1 hour', public: true, user: user) }

    it 'deletes the food record' do
      recipe

      expect do
        delete recipe_path(recipe)
      end.to change(Recipe, :count).by(-1)
    end

    it 'redirects to the index page' do
      recipe

      delete recipe_path(recipe)
      expect(response).to redirect_to(recipes_path)
    end

    it 'sets a flash success message' do
      recipe

      delete recipe_path(recipe)
      expect(flash[:success]).to eq('Recipe deleted successfully!')
    end
  end
end
