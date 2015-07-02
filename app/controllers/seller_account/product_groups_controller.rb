module SellerAccount
  class ProductGroupsController < SellerAccount::BaseController
    def index

      @product_groups = policy_scope(ProductGroup)
      #syntaxe pour index, liée à scope
    end

    def new
      @product_group = ProductGroup.new
      authorize @product_group
      #syntaxe pour les autres fonctions
    end

    def create
      @product_group = current_seller.product_groups.build(product_group_params)
      @product_group.seller = current_seller
      authorize @product_group
      if @product_group.save
        redirect_to seller_account_product_groups_path
      else
        render :new
      end
    end

    def show
      find_product_group
      authorize @product_group
    end

    def edit
      find_product_group
      authorize @product_group
    end

    def update
      find_product_group
      authorize @product_group
      @product_group.update(product_group_params)
      redirect_to seller_account_product_group_path(@product_group)
    end

    def destroy
      find_product_group
      authorize @product_group
      @product_group.destroy
      redirect_to seller_account_product_groups_path
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
