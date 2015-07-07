class AddPriceToBasketItems < ActiveRecord::Migration
  def change
    add_monetize :basket_items, :price, currency: { present: false }
  end
end
