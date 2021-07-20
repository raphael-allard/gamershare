require 'rails_helper'

RSpec.describe User, type: :model do
  it 'persists a user' do
    create(:user)
    expect(User.count).to eq(1)
  end
end
