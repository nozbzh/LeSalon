module SellerAccount
  class ProductRefsController < ApplicationController
    before_action :authenticate_seller!
    before_action :find_product_group
    before_action :find_product_ref

    def index
      @product_refs = []
      @product_group.product_refs.each do |product_ref|
          @product_refs << product_ref
      end
    end

    def new
      @product_ref = ProductRef.new
    end

    def create
      @product_ref = @product_group.product_refs.build(product_ref_params)
      @product_ref.save
      # if @product_ref.save
      #   redirect_to creation of product_refs
      # else
      #   render :new
      # end
    end

    def show

    end

    def edit

    end

    def update
      @product_ref.update(product_ref_params)
      # redirect_to
    end

    private

    def product_ref_params
      params.require(:product_group).permit(:color_name, :price, :promotion_percentage,
        :availability, :delivery_time)
    end

    def find_product_group
      @product_group = current_seller.product_groups.find(params[:id])
    end

    def find_product_ref
      @product_ref = @product_group.product_refs.find(params[:id])
    end

  end
end
