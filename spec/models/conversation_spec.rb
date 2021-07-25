require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let!(:conversation) { create(:conversation) }

  describe '::create' do
    context 'persistence' do
      it 'persists the conversation' do
        expect(Conversation.count).to eq(1)
      end
    end
  end
end
