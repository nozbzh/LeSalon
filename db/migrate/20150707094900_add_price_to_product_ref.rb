class AddPriceToProductRef < ActiveRecord::Migration
  def change
    add_monetize :product_refs, :price, currency: { present: false }
  end
end
