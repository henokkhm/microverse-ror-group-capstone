require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /index' do
    before do
      get foods_path
    end

    it 'returns correct status' do
      expect(response.status).to eq(200)
    end

    ### When there are views:

    # it 'renders the correct template' do
    #   expect(response).to render_template('foods/index')
    # end

    # it 'returns the correct placeholder text' do
    #   expect(response.body).to include('All foods')
    # end
  end

  describe 'GET /new' do
    before do
      get new_food_path
    end

    it 'returns correct status' do
      expect(response.status).to eq(200)
    end

    it 'returns the correct placeholder text' do
      expect(response.body).to include('Add new food')
    end
  end

  describe 'POST /foods' do
    let(:user) { User.create(name: 'tom') }

    context 'with valid parameters' do
      it 'redirects to the index page' do
        food_params = {
          name: 'Carrot',
          measurement_unit: 'kg',
          price: 1,
          quantity: 2,
          user_id: user.id
        }

        post foods_path, params: { food: food_params }
        expect(response).to redirect_to(foods_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new food record' do
        expect do
          post foods_path, params: { food: { name: nil, user_id: user.id } }
        end.not_to change(Food, :count)
      end

      it 'sets a flash alert' do
        post foods_path, params: { food: { name: nil, user_id: user.id } }
        expect(flash[:alert]).to start_with('Error!')
      end
    end
  end

  describe 'DELETE /foods/:id' do
    let(:user) { User.create(name: 'tom') }
    let(:food) { Food.create(name: 'Carrot', measurement_unit: 'kg', price: 1, quantity: 2, user:) }

    it 'deletes the food record' do
      food

      expect do
        delete food_path(food)
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to the index page' do
      food

      delete food_path(food)
      expect(response).to redirect_to(foods_path)
    end

    it 'sets a flash success message' do
      food

      delete food_path(food)
      expect(flash[:success]).to eq('Food deleted successfully!')
    end
  end
end
