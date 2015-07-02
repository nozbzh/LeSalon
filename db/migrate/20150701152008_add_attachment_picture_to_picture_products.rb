class AddAttachmentPictureToPictureProducts < ActiveRecord::Migration
  def self.up
    change_table :picture_products do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :picture_products, :picture
  end
end
