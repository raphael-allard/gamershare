class Trade < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :trade_games, dependent: :destroy

  accepts_nested_attributes_for :trade_games
end
