require 'rails_helper'

RSpec.describe IgdbServices::SearchGames do
  let(:search_games) { IgdbServices::SearchGames.new("skyrim") }

  describe '#call' do
    context 'when searches games' do
      it 'returns the right name' do
        list_of_games = search_games.call
        expect(list_of_games.first["name"]).to eq("The Elder Scrolls 5 Skyrim Anniversary Edition")
      end
    end
  end
end
