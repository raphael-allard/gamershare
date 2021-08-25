class Trade < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :trade_games, dependent: :destroy
  has_many :trade_transitions, autosave: false

  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: TradeTransition,
    initial_state: :pending
  ]

  def state_machine
    @state_machine ||= TradeStateMachine.new(self, transition_class: TradeTransition)
  end
end
