class AddAmountToBillClient < ActiveRecord::Migration
  def change
    add_monetize :bill_clients, :amount, currency: { present: false }
  end
end
