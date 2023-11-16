require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET request to endpoint "/users/:id"' do
    before(:each) do
      @user = User.create(name: 'Henok')
      get user_path(@user)
    end

    it 'return successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
