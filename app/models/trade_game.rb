class TradeGame < ApplicationRecord
  belongs_to :trade
  belongs_to :game

  scope :owner_is, -> (user) { includes(:game).where(games: { owner: user }) }
end
