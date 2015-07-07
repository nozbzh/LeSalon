class AddStatusToBillClient < ActiveRecord::Migration
  def change
    add_column :bill_clients, :status, :string
  end
end
