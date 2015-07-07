module Users
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_order_items

    def index
      @items = policy_scope(OrderItem)
    end

    def new
      @order = Order.new
      authorize @order
      raise
    end

    def create

    end

    private

    def find_order_items
      @order_items = OrderItem.all
    end

    # def find_items_by_seller
    #   @order_items = OrderItem.all
    #   seller_ids = []
    #   @order_items.each do |order_item|
    #     id = order_item.product_ref.product_group.seller_id
    #     if !seller_ids.include? id
    #       seller_ids << id





    #     order_item.product_ref.product_group.seller_id.select { |id| where id == 2 }
    #   end
    # end

  end
end
