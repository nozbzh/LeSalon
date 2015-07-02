class AddAttachmentPictureToPictureRefs < ActiveRecord::Migration
  def self.up
    change_table :picture_refs do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :picture_refs, :picture
  end
end
