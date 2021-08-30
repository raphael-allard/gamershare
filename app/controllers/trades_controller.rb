class TradesController < ApplicationController
  def show
    @trade = Trade.find(params[:id])
    @asker_games = @trade.asker.games
    @receiver_games = @trade.receiver.games
    authorize @trade
  end

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

  def update
  end

  private

  def trade_params
    params.require(:trade).permit(trade_games_attributes:
      [:id, :trade, :game, :_destroy])
  end  
end
