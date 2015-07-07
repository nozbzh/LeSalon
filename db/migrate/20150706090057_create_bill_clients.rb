class CreateBillClients < ActiveRecord::Migration
  def change
    create_table :bill_clients do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

