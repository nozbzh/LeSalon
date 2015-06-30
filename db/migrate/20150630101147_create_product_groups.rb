class CreateProductGroups < ActiveRecord::Migration
  def change
    create_table :product_groups do |t|
      t.string :name
      t.string :category_type
      t.string :category_style
      t.string :material
      t.integer :dimensions_length_cm
      t.integer :dimensions_width_cm
      t.string :dimensions_height_cm
      t.text :description
      t.text :characteristics
      t.integer :seller_id

      t.timestamps null: false
    end
  end
end
