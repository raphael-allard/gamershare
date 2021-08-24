require 'rails_helper'

RSpec.describe "User can see all games", type: :feature do
  context "when user accessed the games index" do
    let(:user) { create(:user) }
    let!(:game) { create(:game) }

    before do
      sign_in(user)
      visit games_path
    end

    it "can access the good path" do
      expect(page).to have_current_path(games_path)
    end

    it "can see a list of games" do
      expect(page).to have_selector("li")
      expect(Game.count).to eq(1)
    end
  end
end
