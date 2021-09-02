class Trade < ApplicationRecord
  include Abyme::Model

  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :trade_games, dependent: :destroy
  has_many :asker_trade_games, inverse_of: :trade, class_name: "TradeGame"
  has_many :receiver_trade_games, inverse_of: :trade, class_name: "TradeGame"
  has_many :trade_transitions, autosave: false, dependent: :destroy

  abymize :asker_trade_games
  abymize :receiver_trade_games

  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: TradeTransition,
    initial_state: :pending
  ]

  def state_machine
    @state_machine ||= TradeStateMachine.new(self, transition_class: TradeTransition)
  end
end
