class Game < ApplicationRecord
  belongs_to :owner, class_name: "User"

  validates :title, :nostalgia_point, :platform, presence: true
  validates :nostalgia_point, inclusion: 1..10

  has_many :trade_games, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
