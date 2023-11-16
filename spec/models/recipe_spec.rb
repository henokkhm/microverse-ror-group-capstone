require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.new(name: 'Tom') }
  let(:recipe) do
    Recipe.new(name: 'Garlic soup', description: 'Description of garlic soup', preparation_time: '15 mins',
               cooking_time: '30 mins', public: true, user:)
  end

  describe 'Validations' do
    before { recipe.save }

    it 'should validate presence of a name' do
      expect(recipe).to be_valid
    end

    it 'should validate presence of a description' do
      expect(recipe).to be_valid
    end

    it 'should validate presence of a preparation time' do
      expect(recipe).to be_valid
    end

    it 'should validate presence of a cooking time' do
      expect(recipe).to be_valid
    end
  end
end
