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

  def destroy
    @basket_item = BasketItem.find(params[:id])
    authorize @basket_item
    @basket_item.destroy
    redirect_to baskets_path
  end

  def update
    @basket_item = BasketItem.find(params[:id])
    authorize @basket_item
    @basket_item.update(items_params)
    redirect_to baskets_path
  end

  private

  def items_params
    params.require(:basket_item).permit(:quantity, :product_ref_id)
  end

  def find_product_ref
    @product_ref = ProductRef.find(params[:basket_item][:product_ref_id])
  end
end
