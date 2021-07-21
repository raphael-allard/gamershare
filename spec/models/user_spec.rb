require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe '#new' do
    context 'validations' do
      it 'is valid with valid attributes' do
        expect(create(:user)).to be_valid
      end

      it 'is not valid without username' do
        user.username = nil
        expect(user).to_not be_valid
      end

      it 'is not valid without address' do
        user.city = nil
        expect(user).to_not be_valid
      end
    end
  end
end
