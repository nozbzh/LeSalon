class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :order_items, :quatity, :quantity
  end
end
