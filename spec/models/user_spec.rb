require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe '::new' do
    context 'persistence' do
      it 'persists user' do
        expect(User.count).to eq(1)
      end
    end

    context 'validations' do
      it 'is valid with valid attributes' do
        expect(user).to be_valid
      end

      it 'is not valid without username' do
        user.username = nil
        expect(user).to_not be_valid
      end

      it 'is not valid with username already taken' do
        new_user = build(:user)
        new_user.email = "new_test@gmail.com"
        new_user.valid?
        expect(new_user.errors.messages).to include(:username)
      end

      it 'is not valid without address' do
        user.city = nil
        expect(user).to_not be_valid
      end
    end
  end
end
