class RemoveOldPriceFromBasketItems < ActiveRecord::Migration
  def change
    remove_column :basket_items, :price, :integer
  end
end
