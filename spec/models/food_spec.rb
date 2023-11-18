require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.new(name: 'Tom') }
  let(:food) { Food.new(name: 'Garlic', measurement_unit: 'kg', price: 10, quantity: 1, user:) }

  describe 'Validations' do
    before { food.save }

    it 'should validate presence of a name' do
      expect(food).to be_valid
    end

    it 'should validate presence of a price' do
      expect(food).to be_valid
    end

    it 'should validate presence of a quantity' do
      expect(food).to be_valid
    end

    it 'validates numericality of price as integer' do
      food.price = 'ten'
      expect(food).not_to be_valid
    end

    it 'validates numericality of quantity as integer' do
      food.quantity = '1kg'
      expect(food).not_to be_valid
    end
  end
end
