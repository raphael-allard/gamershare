require 'rails_helper'

RSpec.describe "User authentication", type: :feature do
  context "when gived correct credentials" do
    let(:user) { create(:user) }

    it "logs in & redirects to good content" do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"
  
      expect(page).to have_content "Log out"
      expect(page).to have_current_path "/games"
    end
  end

  context "when gived wrong credentials" do
    it "displays an error flash alert" do
      visit new_user_session_path
      click_on "Log in"
  
      expect(page).to have_current_path("/users/sign_in")
      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
