module SellerAccount
  class SellersController < SellerAccount::BaseController
    skip_after_action :verify_authorized
    before_action :find_seller, only: [:edit, :update]

    def home
    end

    def profile
      @pictures = policy_scope(PictureSeller)
    end

    def edit

    end

    def update
      @seller.update(seller_params)
      redirect_to seller_account_sellers_profile_path
    end

    private

    def find_seller
      @seller = current_seller
    end

    def seller_params
      params.require(:seller).permit(:description, :description_short, :phone, :address_street, :address_zip, :address_city, :address_country)
    end

  end
end
