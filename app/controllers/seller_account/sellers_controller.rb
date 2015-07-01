module SellerAccount
  class SellersController < ApplicationController
    before_action :authenticate_seller!
    before_action :find_seller

    def home
      authorize @seller
    end

    private

    def find_seller
      @seller = current_seller
    end

  end
end
