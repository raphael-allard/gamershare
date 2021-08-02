require 'rails_helper'

RSpec.feature "Home page", type: :feature do
  scenario "user accesses the content of home page" do
    visit root_path
    expect(page).to have_content "pages"
  end
  
  # scenario "user creates a new project" do
  #   user = create(:user)
  #   sign_in user
  #   visit root_path
  #   expect(page).to have_content "Log out"
  # end
end
