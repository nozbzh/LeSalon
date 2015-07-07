class RemoveSellerIdFromOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :seller_id, :integer
  end
end
