class TradeStateMachine
  include Statesman::Machine

  state :pending, initial: true
  state :one_validated
  state :counter_proposal
  state :refused
  state :two_validated

  transition from: :pending, to: :one_validated
  transition from: :one_validated, to: [:two_validated, :refused, :counter_proposal]
  transition from: :counter_proposal, to: :one_validated
end
