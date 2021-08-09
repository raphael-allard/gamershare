class TradesController < ApplicationController
  def new
    @trade = Trade.new
    authorize @trade
  end
end
