class RemoveOldPriceFromProductRefs < ActiveRecord::Migration
  def change
    remove_column :product_refs, :price, :integer
  end
end
