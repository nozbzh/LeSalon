class RemoveStatusFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :status_client, :integer
  end
end
