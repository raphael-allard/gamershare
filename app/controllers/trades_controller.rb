class TradesController < ApplicationController
  def show
    @trade = Trade.find(params[:id])
    authorize @trade
  end

  def new
    @trade = Trade.new
    @asker_games = current_user.games
    @game = Game.find(params[:game_id])
    @receiver_games = @game.owner.games
    authorize @trade
  end

  def create
    @trade = Trade.new
    @trade.asker = current_user
    key_game = params.dig(:trade, :receiver_trade_games_attributes).keys.first
    @game = Game.find(params.dig(:trade, :receiver_trade_games_attributes).dig(key_game, :game))
    @trade.receiver = @game.owner
    authorize @trade

    if @trade.save
      # This line doesn't work at all
      @trade.asker_trade_games.create!(trade_params)
      redirect_to trade_path(@trade)
    else
      flash[:alert] = "Something went wrong, please contact us"
      render "games/show"
    end
  end

  private

  def trade_params
    params.require(:trade).permit(asker_trade_games_attributes: [:id, :game, :_destroy],
                                  receiver_trade_games_attributes: [:id, :game, :_destroy])
  end
end
