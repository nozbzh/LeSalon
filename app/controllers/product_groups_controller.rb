class ProductGroupsController < ApplicationController
  def index
    @product_groups = policy_scope(ProductGroup)

    if params[:category]
      @product_groups = @product_groups.where(category_type: params[:category])
    end
  end

  def show
    unless params[:product].nil?
      @product = ProductRef.find(params[:product])
    end
    @product_group = ProductGroup.find(params[:id])
    authorize @product_group
    @basket_item = BasketItem.new
  end
end
