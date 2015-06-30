class CreatePictureSellers < ActiveRecord::Migration
  def change
    create_table :picture_sellers do |t|
      t.string :name
      t.references :seller, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
