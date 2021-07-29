require 'rails_helper'

RSpec.describe Trade, type: :model do
  let!(:trade) { create(:trade) }

  describe '::create' do
    context 'persistence' do
      it 'persists the trade' do
        expect(Trade.count).to eq(1)
      end
    end

    context 'associations' do
      it 'has many trade games' do
        expect(trade.trade_games.new.class).to eq(TradeGame)
      end

      it 'destroys trade games associated' do
        trade.trade_games.create(game: build(:game))
        trade.destroy
        expect(trade.trade_games.count).to eq(0)
      end
    end
  end
end
