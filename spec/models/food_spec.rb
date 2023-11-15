require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:price).only_integer }
    it { should validate_numericality_of(:quantity).only_integer }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
