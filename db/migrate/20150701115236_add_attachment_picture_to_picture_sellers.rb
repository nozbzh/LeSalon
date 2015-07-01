class AddAttachmentPictureToPictureSellers < ActiveRecord::Migration
  def self.up
    change_table :picture_sellers do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :picture_sellers, :picture
  end
end
