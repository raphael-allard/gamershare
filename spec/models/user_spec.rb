require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe '::create' do
    context 'persistence' do
      it 'persists the user' do
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

      it 'is not valid if username already taken' do
        new_user = User.new(user.attributes)
        new_user.valid?
        expect(new_user.errors).to include(:username)
      end

      it 'is not valid without address' do
        user.city = nil
        expect(user).to_not be_valid
      end
    end

    context 'associations' do
      it 'has many games' do
        expect(user.games.new.class).to eq(Game)
      end
    end
  end
end
