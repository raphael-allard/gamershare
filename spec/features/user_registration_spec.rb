require 'rails_helper'

RSpec.feature "User registration", type: :feature do
  scenario "signs up with good content" do
    visit new_user_registration_path

    fill_in "Username", with: "kratos"
    fill_in "Email", with: "kratos@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    fill_in "City", with: "Paris"

    click_button "Sign up"
    
    expect(page).to have_content "Log out"
    expect(User.count).to eq(1)
  end

  scenario "signs up with bad content" do
    visit new_user_registration_path
    click_button "Sign up"
    expect(page).to have_current_path "/users"
    expect(page).to have_content "Please review the problems below:"
  end
end
