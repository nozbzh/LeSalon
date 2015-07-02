class CreatePictureProducts < ActiveRecord::Migration
  def change
    create_table :picture_products do |t|
      t.integer :product_group_id

      t.timestamps null: false
    end
  end
end
