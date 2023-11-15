require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /index" do
    before do
      get recipes_path
    end

    it 'returns correct status' do
      expect(response.status).to eq(200)
    end
  end
end
