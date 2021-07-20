class Conversation < ApplicationRecord
  belongs_to :first_participant
  belongs_to :second_participant
end
