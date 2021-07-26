require 'rails_helper'

RSpec.describe Message, type: :model do
  let!(:message) { create(:message) }

  describe '::create' do
    context 'persistence' do
      it 'persists the message' do
        expect(Message.count).to eq(1)
      end
    end

    context 'validations' do
      it 'is not valid if content is empty string' do
        message.content = ""
        message.valid?
        expect(message.errors).to include(:content)
      end
    end
  end
end
