require 'rails_helper'

RSpec.feature "User session", type: :feature do
  scenario "signs in with good content" do
    user = create(:user)

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content "Log out"
    expect(page).to have_current_path "/games"
  end

  scenario "signs in with bad content" do
    visit new_user_session_path
    click_button "Log in"

    expect(page).to have_current_path("/users/sign_in")
    expect(page).to have_content("Invalid Email or password.")
  end
end
