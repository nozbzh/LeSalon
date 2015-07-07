class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quatity
      t.references :order, index: true, foreign_key: true
      t.references :product_ref, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
