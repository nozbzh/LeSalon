class AddApprovedToSeller < ActiveRecord::Migration
  def change
    add_column :sellers, :approved, :boolean, :default => false, :null => false
    add_index  :sellers, :approved
  end

  def self.down
    remove_index  :sellers, :approved
    remove_column :sellers, :approved
  end
end
