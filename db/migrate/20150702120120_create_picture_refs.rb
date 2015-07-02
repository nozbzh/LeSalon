class CreatePictureRefs < ActiveRecord::Migration
  def change
    create_table :picture_refs do |t|
      t.integer :product_ref_id

      t.timestamps null: false
    end
  end
end
