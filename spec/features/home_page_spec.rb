require 'rails_helper'

RSpec.feature "Home page", type: :feature do
  scenario "user accesses the content of home page" do
    visit root_path
    expect(page).to have_content "GamerShare"
  end

end
