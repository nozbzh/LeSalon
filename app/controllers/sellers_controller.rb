class SellersController < ApplicationController

  def show
    @seller = Seller.find(params[:id])
    @seller_location = [{ lat: @seller.latitude, lng: @seller.longitude }]
  end
end
