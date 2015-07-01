module SellerAccount
  class BaseController < ApplicationController
    before_action :authenticate_seller!

    protected

    def pundit_user
      current_seller
    end
  end
end
