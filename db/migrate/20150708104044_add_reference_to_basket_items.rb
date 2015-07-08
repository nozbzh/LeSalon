class AddReferenceToBasketItems < ActiveRecord::Migration
  def change
    add_column :basket_items, :reference, :string
  end
end
