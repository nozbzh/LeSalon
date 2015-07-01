module SellerAccount
  class PictureSellersController < ApplicationController
    before_action :authenticate_seller!

    def index
      @pictures = policy_scope(PictureSeller)
    end

    def show

    end

    def new
      @picture = PictureSeller.new
      authorize @picture
    end

    def create
      @picture = current_seller.picture_sellers.build(picture_params)
      @picture.seller = current_seller
      authorize @picture
      if @picture.save
        raise ""
        redirect_to seller_account_picture_sellers_path
      else
        raise ""
      end
    end

    def edit

    end

    def update

    end

    private

    def picture_params
      params.require(:picture_seller).permit(:picture)
    end

    def find_picture
      @picture = PictureSeller.find
    end

  end
end
