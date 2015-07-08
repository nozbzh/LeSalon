module SellerAccount
  class OrdersController < SellerAccount::BaseController
    before_action :authenticate_seller!

    def index
      @orders = policy_scope(Order).order(created_at: :DESC)
    end

    def pending_orders
      @orders = policy_scope(Order).where(status_order: "pending").order(created_at: :DESC)
      authorize @orders
    end

    def show
      @order = Order.find(params[:id])
      authorize @order
    end

    def sent
      @order = Order.find(params[:id])
      @order.status_order = "sent"
      authorize @order
      @order.save
      redirect_to seller_account_order_path(@order)
    end

  end
end
