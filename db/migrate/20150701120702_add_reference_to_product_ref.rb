class AddReferenceToProductRef < ActiveRecord::Migration
  def change
    add_column :product_refs, :reference, :string
  end
end
