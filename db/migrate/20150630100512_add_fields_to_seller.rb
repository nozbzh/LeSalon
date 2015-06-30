class AddFieldsToSeller < ActiveRecord::Migration
  def change
    add_column :sellers, :name, :string
    add_column :sellers, :description_short, :text
    add_column :sellers, :description, :text
    add_column :sellers, :phone, :string
    add_column :sellers, :address_street, :string
    add_column :sellers, :address_zip, :string
    add_column :sellers, :address_city, :string
    add_column :sellers, :address_country, :string
    add_column :sellers, :latitude, :integer
    add_column :sellers, :longitude, :integer
  end
end
