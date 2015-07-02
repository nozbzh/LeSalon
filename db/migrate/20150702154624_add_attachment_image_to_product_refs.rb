class AddAttachmentImageToProductRefs < ActiveRecord::Migration
  def self.up
    change_table :product_refs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :product_refs, :image
  end
end
