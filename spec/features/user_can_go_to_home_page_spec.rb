require 'rails_helper'

RSpec.describe "User can go to home page", type: :feature do
  context "when user reached the home page" do
    it "can access the good path" do
      visit root_path
      expect(page).to have_current_path(root_path)
    end
  end
end
