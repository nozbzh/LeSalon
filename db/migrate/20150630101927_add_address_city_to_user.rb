class AddAddressCityToUser < ActiveRecord::Migration
  def change
    add_column :users, :address_city, :string
  end
end
