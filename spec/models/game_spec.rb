require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { create(:game) }

  context '#import_data' do
    it 'returns the right title' do
      expect(game.title).to eq("Mega Man X")
    end
  end
end
