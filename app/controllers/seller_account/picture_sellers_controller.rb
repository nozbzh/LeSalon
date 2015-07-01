module SellerAccount
  class PictureSellersController < SellerAccount::BaseController
    before_action :authenticate_seller!

    def index
      @pictures = policy_scope(PictureSeller)
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
        redirect_to seller_account_picture_sellers_path
      else

      end
    end

    def destroy
      find_picture
      @picture.destroy
      redirect_to seller_account_picture_sellers_path
    end

    private

    def picture_params
      params.require(:picture_seller).permit(:picture)
    end

    def find_picture
      @picture = current_seller.picture_sellers.find(params[:id])
    end

  end
end
