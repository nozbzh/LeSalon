class ProductGroupsController < ApplicationController
  def index
    @product_groups = policy_scope(ProductGroup)

    if params[:category]
      @product_groups = @product_groups.where(category_type: params[:category])
    end

    # @pg_canapes = @product_groups.category_type("Canapés")
  end
end
