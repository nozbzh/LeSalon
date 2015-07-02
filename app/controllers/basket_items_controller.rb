class BasketItemsController < ApplicationController
  before_action :find_product_ref, only: [ :create ]
  before_action :authenticate_user!

  def create
    @basket_item = current_user.basket.basket_items.build(items_params)
    @basket_item.product_ref = @product_ref
    authorize @basket_item
    @basket_item.save
    redirect_to baskets_path
  end

  private

  def items_params
    params.require(:basket_item).permit(:quantity)
  end

  def find_product_ref
    @product_ref = ProductRef.find(params[:product_ref_id])
  end
end
