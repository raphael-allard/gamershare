require 'rails_helper'

RSpec.describe IgdbServices::FetchGameData do
  let(:fetch_game_data) { IgdbServices::FetchGameData.new(123) }

  describe '#call' do
    context 'when fetches game data' do
      it 'returns the right name' do
        data = fetch_game_data.call
        expect(data["name"]).to eq("World of Warcraft")
      end
    end
  end
end
