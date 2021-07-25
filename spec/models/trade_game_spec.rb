require 'rails_helper'

RSpec.describe TradeGame, type: :model do
  let!(:trade_game) { create(:trade_game) }

  describe '::create' do
    context 'persistence' do
      it 'persists the trade game' do
        expect(TradeGame.count).to eq(1)
      end
    end
  end
end
