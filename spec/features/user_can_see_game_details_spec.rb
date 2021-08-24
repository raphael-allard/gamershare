require 'rails_helper'

RSpec.describe "User can see game details", type: :feature do
  context "when user accessed the game show" do
    let(:user) { create(:user) }
    let(:game) { user.games.create(attributes_for :game) }

    before do
      sign_in(user)
      visit game_path(game)
    end

    it "contains the good path" do
      expect(page).to have_current_path("/games/#{game.id}")
    end

    it "can see the name of the game" do
      expect(page).to have_content("Mega Man X")
    end

    it "can see the game's owner name" do
      expect(page).to have_content(game.owner.username)
      expect(user.username).to eq(game.owner.username)
    end
  end
end
