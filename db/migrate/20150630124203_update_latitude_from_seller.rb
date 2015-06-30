class UpdateLatitudeFromSeller < ActiveRecord::Migration
  def change
    change_column :sellers, :latitude, :float
    change_column :sellers, :longitude, :float
  end
end
