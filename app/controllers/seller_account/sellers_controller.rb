module SellerAccount
  class SellersController < SellerAccount::BaseController
    skip_after_action :verify_authorized

    def home
    end

    def profile
      @pictures = policy_scope(PictureSeller)
    end

    def edit

    end

    def update

    end


  end
end
