class BillClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_bill, only: [:show, :update]

  def show
    @address = Address.new
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
      sum += item.product_ref.price * (1 - item.product_ref.promotion_percentage) * item.quantity
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
        item.reference = basket_item.product_ref.reference
        item.save
      end
    end
    authorize bill
    bill.save
    session[:bill_id] = bill.id
    redirect_to bill_client_path(bill)
  end

  def update
    address_chosen  = current_user.addresses.find(params[:address_id])
    @address_bill ||= @bill.address || @bill.build_address

    @address_bill.delivery_address_street = address_chosen.delivery_address_street
    @address_bill.delivery_address_zip = address_chosen.delivery_address_zip
    @address_bill.delivery_address_city = address_chosen.delivery_address_city

    if @address_bill.save
      redirect_to new_bill_client_payment_path(@bill)
    else
      render :show
    end
  end

  def confirmation
    @bill = BillClient.where(status: 'payed').find(params[:id])
    authorize @bill
  end

  private

  def find_bill
    @bill = BillClient.where(status: 'pending').find(session[:bill_id])
    authorize @bill
  end
end
