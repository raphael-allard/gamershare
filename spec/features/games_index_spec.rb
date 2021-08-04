require 'rails_helper'

RSpec.describe "Games#index", type: :feature do
  context "when user accessed to the page" do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      visit games_path
    end

    it "can see a list of games" do
      expect(page).to have_selector "ul li"
    end

    it "can search for a game" do
      expect(page).to have_css "#game-search-bar"
    end

    it "can click on the button 'Add a game'" do
      click_on "Add a game"
      expect(page).to have_current_path(new_game_path)
    end
  end
end
