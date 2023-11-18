require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { User.create(name: 'tom', email: 'name@gmail.com', password: '12345678') }

  before do
    sign_in user
  end

  describe 'GET /index' do
    before do
      get recipes_path
    end

    it 'returns correct status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /recipes/:id' do
    let(:recipe) do
      Recipe.create(id: 1, name: 'Carrot soup', preparation_time: '12 mins', cooking_time: '1 hour', public: true,
                    user:)
    end

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
      expect(flash[:notice]).to eq('Recipe deleted successfully!')
    end
  end
  
  describe 'GET /public_recipes' do
    before do
      get public_recipes_path
    end

    it 'returns correct status' do
      expect(response.status).to eq(200)
    end

    it 'renders placeholder on page' do
      expect(response.body).to include('Public Recipes')
    end
  end
end
