class AddSellerIdToOrderItem < ActiveRecord::Migration
  def change
    add_reference :order_items, :seller, index: true, foreign_key: true
  end
end
