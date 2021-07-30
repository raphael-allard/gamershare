require 'rails_helper'

RSpec.describe IgdbServices::SearchGames do
  let(:search_games) { IgdbServices::SearchGames.new("skyrim") }

  describe '#call' do
    context 'when fetchs data' do
      it 'returns the right name' do
        list_of_games = search_games.call
        expect(list_of_games.first["name"]).to eq("Ultimate Skyrim")
      end
    end
  end
end
