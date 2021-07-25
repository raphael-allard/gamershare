require 'rails_helper'

RSpec.describe Trade, type: :model do
  let!(:trade) { create(:trade) }

  describe '::create' do
    context 'persistence' do
      it 'persists the trade' do
        expect(Trade.count).to eq(1)
      end
    end
  end
end
