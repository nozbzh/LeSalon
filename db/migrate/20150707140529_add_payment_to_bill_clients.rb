class AddPaymentToBillClients < ActiveRecord::Migration
  def change
    add_column :bill_clients, :payment, :json
  end
end
