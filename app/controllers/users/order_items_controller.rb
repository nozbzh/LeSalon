module Users
  class OrderItemsController < ApplicationController
    before_action :authenticate_user!

    def index
      @items = policy_scope(OrderItem)
    end

    def new
      @order_item = OrderItem.new
      authorize @order_item
    end

  end
end
