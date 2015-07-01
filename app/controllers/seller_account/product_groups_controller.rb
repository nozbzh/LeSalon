module SellerAccount
  class ProductGroupsController < ApplicationController
    before_action :authenticate_seller!

    def index
      @product_groups = []
      current_seller.product_groups.each do |product_group|
        @product_groups << product_group
      end
    end

    def new
      @product_group = ProductGroup.new
    end

    def create
      @product_group = current_seller.product_groups.build(product_group_params)
      @product_group.save
      # if @product_group.save
      #   redirect_to creation of product_refs
      # else
      #   render :new
      # end
    end

    def show
      find_product_group
      @product_group = ProductGroup.find(params[:id])
    end

    def edit
      find_product_group
    end

    def update
      @product_group.update(product_group_params)
      # redirect_to
    end

    private

    def product_group_params
      params.require(:product_group).permit(:name, :category_type, :category_style,
        :material, :dimensions_length_cm, :dimensions_width_cm, :dimensions_height_cm,
        :description, :characteristics)
    end

    def find_product_group
      @product_group = current_seller.product_groups.find(params[:id])
    end

  end
end
