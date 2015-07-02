class AddAttachmentPictureToProductRefs < ActiveRecord::Migration
  def self.up
    change_table :product_refs do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :product_refs, :picture
  end
end
