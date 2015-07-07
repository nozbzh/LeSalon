class AddPriceToOrderItem < ActiveRecord::Migration
  def change
    add_monetize :order_items, :price, currency: { present: false }
  end
end
