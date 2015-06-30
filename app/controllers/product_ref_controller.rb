class ProductRefController < ApplicationController
  before_action :authenticate_seller!
  before_action :find_product_group
  before_action :find_product_ref

  def index
    @product_refs = []
    @product_group.product_refs.each do |product_ref|
        @product_refs << product_ref
    end
  end

  private

  def product_ref_params
    params.require(:product_group).permit(:color_name, :price, :promotion_percentage,
      :availability, :delivery_time)
  end

end
