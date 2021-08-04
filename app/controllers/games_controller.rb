class GamesController < ApplicationController
  def index
    @games = policy_scope(Game)
  end

  def new
    @game = Game.new
    authorize @game
  end
end
