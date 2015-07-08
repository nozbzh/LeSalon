module Admin
  class SellersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_seller, only: [:approve, :unapprove]

    after_action :verify_policy_scoped, only: [:index, :approved]
    skip_after_action :verify_authorized, only: [:approved]

    def index
      @sellers = policy_scope(Seller)

      if params[:approved] == "false"
        @sellers = @sellers.find_all_by_approved(false)
      end
    end

    def approved
      @sellers = policy_scope(Seller)
      @sellers = @sellers.where(approved: true)

      render :index
    end

    def approve
      @seller.approved = true
      @seller.save

      redirect_to admin_sellers_path
    end

    def unapprove
      @seller.approved = false
      @seller.save

      redirect_to admin_sellers_path
    end

    private

    def find_seller
      @seller = Seller.find(params[:id])
      authorize @seller
    end
  end
end
