module SellerAccount
class PictureProductsController < SellerAccount::BaseController
  before_action :authenticate_seller!

    def index
      @picture_products = policy_scope(PictureProduct)
    end


    def new
      find_product_group
      @picture_product = PictureProduct.new
      authorize @picture_product
    end

    def create
      find_product_group
      @picture_product = @product_group.picture_products.build(picture_params)
      @picture_product.product_group = @product_group
      authorize @picture_product
      if @picture_product.save
        redirect_to seller_account_product_group_path
      else
        render :new
      end
    end

    def destroy

    end

    private

    def picture_params
      params.require(:picture_product).permit(:picture)
    end

    def find_product_group
      @product_group = ProductGroup.find(params[:product_group_id])
    end
  end
end
