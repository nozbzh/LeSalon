class BillClientsController < ApplicationController
  before_action :authenticate_user!

  def show
    @bill = BillClient.where(status: 'pending').find(session[:bill_id])
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

    sum = 0
    current_user.basket.basket_items.each do |item|
      sum += item.product_ref.price * item.quantity
    end

    bill.amount = sum

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
    redirect_to bill_client_path(bill)
  end


  def confirmation
    @bill = BillClient.where(status: 'payed').find(params[:id])
    authorize @bill
  end

end
