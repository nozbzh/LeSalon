class ProductGroupsController < ApplicationController
  def index
    @product_groups = policy_scope(ProductGroup)

    if params[:category]
      @product_groups = @product_groups.where(category_type: params[:category])
    end

    if params[:category_style]
      @product_groups = @product_groups.where(category_style: params[:category_style])
    end

    if params[:price_min]
      products = []
      @product_groups.each do |product_group|
        if (product_group.product_refs.first.price * (1 - product_group.product_refs.first.promotion_percentage)).to_i >= params[:price_min].to_i
          products << product_group
        end
      end
      @product_groups = products
    end


    if params[:price_max]
      products = []
      @product_groups.each do |product_group|
        if (product_group.product_refs.first.price * (1 - product_group.product_refs.first.promotion_percentage)).to_i <= params[:price_max].to_i
          products << product_group
        end
    end
    @product_groups = products
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
