class TradesController < ApplicationController
  def new
    @trade = Trade.new
    @asker = current_user
    @game = Game.find(params[:game_id])
    @receiver = @game.owner
    authorize @trade
  end
end
