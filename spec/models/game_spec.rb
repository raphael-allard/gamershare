require 'rails_helper'

RSpec.describe Game, type: :model do
  let!(:game) { create(:game) }

  describe '::create' do
    context 'persistence' do
      it 'persists the game' do
        expect(Game.count).to eq(1) 
      end
    end
    
    context 'validations' do
      it 'is valid with valid attributes' do
        expect(game).to be_valid
      end

      it 'is not valid without title' do
        game.title = nil
        expect(game).to_not be_valid
      end

      it 'is not valid without nostalgia_point' do
        game.nostalgia_point = nil
        expect(game).to_not be_valid
      end

      it 'is not valid if nostalgia_point diff from 0..10' do
        game.nostalgia_point = 15
        game.valid?
        expect(game.errors).to include(:nostalgia_point)
      end

      it 'is not valid without platform' do
        game.platform = nil
        expect(game).to_not be_valid
      end
    end
  end
end
