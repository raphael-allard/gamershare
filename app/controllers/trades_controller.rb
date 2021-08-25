class TradesController < ApplicationController
  def create
    @trade = Trade.new
    @trade.asker = current_user
    @game = Game.find(params[:game_id])
    @trade.receiver = @game.owner
    authorize @trade
    
    if @trade.save
      @trade.trade_games.create(game: @game)
      redirect_to trade_path(@trade)
    else
      flash[:alert] = "Something went wrong, please contact us"
      render "games/show"
    end
  end
end
