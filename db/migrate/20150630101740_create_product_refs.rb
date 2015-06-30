class CreateProductRefs < ActiveRecord::Migration
  def change
    create_table :product_refs do |t|
      t.integer :product_group_id
      t.string :color_name
      t.integer :price
      t.decimal :promotion_percentage
      t.string :availability
      t.string :delivery_time

      t.timestamps null: false
    end
  end
end
