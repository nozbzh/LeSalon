module SellerAccount
  class PictureRefsController < SellerAccount::BaseController
    before_action :authenticate_seller!

  def create
      find_product_ref
      find_product_group
      @picture_ref = PictureRef.create(picture_params)
      @picture_ref.product_ref = @product_ref
      authorize @picture_ref
      if @picture_ref.save
        redirect_to seller_account_product_group_path(@product_group)
      else
        :back
      end
  end

  def destroy
      find_picture_ref
      find_product_group
      authorize @picture_ref
      authorize @product_group
      @picture_ref.destroy
      redirect_to seller_account_product_group_path(@product_group)
    end

  private

    def picture_params
      params.require(:picture_ref).permit(:picture)
    end

    def find_product_ref
      @product_ref = ProductRef.find(params[:product_ref_id])
    end

    def find_product_group
      @product_group = ProductRef.find(params[:product_group_id])
    end

    def find_picture_ref
      @picture_ref = PictureRef.find(params[:id])
    end

end
end
