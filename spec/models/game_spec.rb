require 'rails_helper'

RSpec.describe Game, type: :model do
  let!(:game) { create(:game) }

  describe '::create' do
    context 'with persistence' do
      it 'persists the game' do
        expect(Game.count).to eq(1) 
      end
    end
    
    context 'with validations' do
      it 'is valid with valid attributes' do
        expect(game).to be_valid
      end

      it 'is not valid without name' do
        game.name = nil
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

    context 'with associations' do
      it 'has many trade games' do
        expect(game.trade_games.new.class).to eq(TradeGame)
      end

      it 'destroys trade games associated' do
        game.trade_games.create(trade: build(:trade))
        game.destroy
        expect(game.trade_games.count).to eq(0)
      end

      it 'has many favorites' do
        expect(game.favorites.new.class).to eq(Favorite)
      end

      it 'destroys favorites associated' do
        game.favorites.create(user: build(:user))
        game.destroy
        expect(game.favorites.count).to eq(0)
      end
    end
  end
end
