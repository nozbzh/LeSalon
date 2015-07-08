class AddReferenceToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :reference, :string
  end
end
