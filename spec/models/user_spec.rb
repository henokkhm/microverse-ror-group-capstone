require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'name', email: 'name@gmail.com', password: '12345678') }

  describe 'Validations' do
    before { user.save }

    it 'should validate presence of a name' do
      expect(user).to be_valid
    end
  end
end
