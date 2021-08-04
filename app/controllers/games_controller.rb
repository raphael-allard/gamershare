class GamesController < ApplicationController
  def index
    @games = policy_scope(Game)

    if params[:query]
      @games = @games.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: "games/partials/list.html", locals: { games: @games } }
    end
  end

  def new
    @game = Game.new
    authorize @game
  end
end
