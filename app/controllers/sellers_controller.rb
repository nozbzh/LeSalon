class SellersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_seller!

  def show_to_user
    @seller = Seller.find(params[:id])
    @seller_location = [
      {
       lat: @seller.latitude,
       lng: @seller.longitude
       }
     ]
    authorize @seller
  end


end
