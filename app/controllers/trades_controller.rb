class TradesController < ApplicationController
  def new
    @trade = Trade.new
    authorize @trade
    
    @trade.trade_games.new
    @asker = User.find(params[:asker])
    @receiver = User.find(params[:receiver])
  end
end
