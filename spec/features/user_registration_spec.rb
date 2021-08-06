require 'rails_helper'

RSpec.describe "User registration", type: :feature do
  context "when gived correct credentials" do
    it "creates account & redirects to good page" do
      visit new_user_registration_path
      fill_in "Username", with: "kratos"
      fill_in "Email", with: "kratos@gmail.com"
      fill_in "user_password", with: "123456"
      fill_in "user_password_confirmation", with: "123456"
      fill_in "City", with: "Paris"
      click_on "Create my account"
      
      expect(page).to have_content "Log out"
      expect(User.count).to eq(1)
      expect(page).to have_current_path "/games"
    end
  end

  context "when gived wrong credentials" do
    it "displays an error flash alert" do
      visit new_user_registration_path
      click_on "Create my account"
  
      expect(page).to have_current_path "/users"
      expect(page).to have_content "Please review the problems below:"
    end
  end
end
