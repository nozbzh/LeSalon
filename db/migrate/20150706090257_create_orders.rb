class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status_order
      t.string :status_client
      t.references :seller, index: true, foreign_key: true
      t.references :bill_client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
