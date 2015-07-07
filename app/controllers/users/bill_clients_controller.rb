module Users
  class BillClientsController < ApplicationController
    before_action :authenticate_user!

    def new
      @bill = BillClient.new
      authorize @bill
    end

    def create
      if session[:bill_id]
        bill = BillClient.where(id: session[:bill_id]).first_or_initialize
        bill.orders.clear
      else
        bill = BillClient.new
      end

      basket = current_user.basket
      sellers = Seller.select("distinct(sellers.id), sellers.*")
        .joins(product_groups: { product_refs: { basket_items: :basket }})
        .where("baskets.id" => basket.id)

      bill.user = current_user
      bill.status = "pending"

      sellers.each do |seller|
        order = bill.orders.new
        order.seller = seller
        order.status_order = "pending"
        order.save

        basket_items = basket.basket_items.joins(product_ref: :product_group).where("product_groups.seller_id" => seller.id)
        basket_items.each do |basket_item|
          item = order.order_items.new
          item.product_ref = basket_item.product_ref
          item.quantity = basket_item.quantity
          item.price = basket_item.product_ref.price
          item.save
        end
      end
      authorize bill
      bill.save
      session[:bill_id] = bill.id
      redirect_to new_bill_client_path
    end

    def show
      authorize @bill_client
    end


  end
end
