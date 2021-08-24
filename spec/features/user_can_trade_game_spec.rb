require 'rails_helper'

RSpec.describe "User can trade game", type: :feature do
  context "when user asked for a trade" do
    let(:asker) { create(:user) }
    let(:receiver) { create(:user) }
    let(:game) { receiver.games.create(attributes_for :game) }

    it "can access to the good path" do
      sign_in(asker)
      visit game_path(game)
      click_on "Ask for a trade"
      expect(page).to have_current_path(new_game_trade_path(game))
    end
  end
end
