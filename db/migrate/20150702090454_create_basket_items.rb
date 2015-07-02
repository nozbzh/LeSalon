class CreateBasketItems < ActiveRecord::Migration
  def change
    create_table :basket_items do |t|
      t.integer :quantity
      t.references :product_ref, index: true, foreign_key: true
      t.references :basket, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
