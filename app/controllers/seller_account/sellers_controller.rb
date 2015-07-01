module SellerAccount
  class SellersController < SellerAccount::BaseController
    skip_after_action :verify_authorized

    def home
    end
  end
end
