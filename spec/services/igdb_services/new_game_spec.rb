require 'rails_helper'

RSpec.describe IgdbServices::NewGame do
  let(:fetch_game_data) { IgdbServices::FetchGameData.new(123) }
  let(:new_game) { IgdbServices::NewGame.new(fetch_game_data.call) }

  describe '#converting_unix_to_date' do
    context 'when given a integer timestamp' do
      it 'returns a good date' do
        date = new_game.converting_unix_to_date(1101168000)
        expect(date).to eq(Date.new(2004, 11, 23))
      end
    end
  end

  describe '#parsing_data' do
    context 'when given an array of hashes' do
      it 'returns an array with good content' do
        arr = new_game.data["involved_companies"]
        expect(new_game.parsing_data(arr)).to eq(["Blizzard Entertainment"])
      end
    end
  end

  describe '#call' do
    context 'when called on instance of NewGame' do
      it 'creates an instance of Game' do
        expect(new_game.call.class).to eq(Game)
      end
    end
  end
end
