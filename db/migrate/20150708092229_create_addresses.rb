class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :delivery_address_street
      t.string :delivery_address_zip
      t.string :delivery_address_city
      t.references :user, index: true, foreign_key: true
      t.references :bill_client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
