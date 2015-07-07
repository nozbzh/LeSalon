module SellerAccount
  class OrdersController < SellerAccount::BaseController
    before_action :authenticate_seller!
    skip_after_action :verify_policy_scoped

    def index
      @orders = current_seller.orders.where(status_order: "pending")
    end

    def show
      @order = Order.find(params[:id])
      authorize @order
    end

  end
end
