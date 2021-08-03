# frozen_string_literal: true

class GameCardComponent < ViewComponent::Base
  with_collection_parameter :game

  def initialize(game:)
    @game = game
  end
end
