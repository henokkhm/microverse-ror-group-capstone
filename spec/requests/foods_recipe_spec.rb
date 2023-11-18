require 'rails_helper'

RSpec.describe 'FoodsRecipes', type: :request do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password123') }
  let(:recipe) do
    Recipe.create(id: 1, name: 'Carrot soup', preparation_time: '12 mins', cooking_time: '1 hour', public: true, user:)
  end
  let(:food) do
    Food.create(name: 'Carrot', measurement_unit: 'kg', price: 1,
                quantity: 2, user:)
  end

  before do
    sign_in user
  end

  describe 'GET /index' do
    before do
      get new_recipe_foods_recipe_path(recipe)
    end

    it 'returns correct status' do
      expect(response.status).to eq(200)
    end

    it 'has placeholder text' do
      expect(response.body).to include('Add Ingredients')
    end
  end

  describe 'Create method' do
    it 'redirects to the index page' do
      food_recipe_params = {
        food_id: food.id,
        quantity: 10
      }
      post recipe_foods_recipe_index_path(recipe), params: { recipe_id: recipe.id, foods_recipe: food_recipe_params }
      expect(response).to redirect_to(recipe_path(recipe))
    end

    it 'shows flash on success' do
      food_recipe_params = {
        food_id: food.id,
        quantity: 10
      }
      post recipe_foods_recipe_index_path(recipe), params: { recipe_id: recipe.id, foods_recipe: food_recipe_params }
      expect(flash[:notice]).to eq('Ingredient added successfully!')
    end

    it 'ON ERROR: shows error flash' do
      invalid_params = {
        food_id: nil,
        quantity: nil
      }
      post recipe_foods_recipe_index_path(recipe), params: { recipe_id: recipe.id, foods_recipe: invalid_params }

      expect(flash[:alert]).to eq('Error adding ingredient.')
    end

    it 'ON ERROR: redirect to recipes list' do
      invalid_params = {
        food_id: nil,
        quantity: nil
      }
      post recipe_foods_recipe_index_path(recipe), params: { recipe_id: recipe.id, foods_recipe: invalid_params }
      expect(response).to redirect_to(recipes_path)
    end
  end
end
