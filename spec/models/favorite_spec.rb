require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let!(:favorite) { create(:favorite) }

  describe '::create' do
    context 'persistence' do
      it 'persists the favorite' do
        expect(Favorite.count).to eq(1)
      end
    end
  end
end
