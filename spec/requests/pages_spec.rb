require 'rails_helper'

RSpec.describe 'Pages', type: :request do
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
