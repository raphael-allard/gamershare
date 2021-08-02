require 'rails_helper'

RSpec.feature "Home page", type: :feature do
  scenario "user visites the home page" do
    visit root_path
    expect(page).to have_content "lol"
  end
end
