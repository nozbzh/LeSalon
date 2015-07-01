# == Schema Information
#
# Table name: picture_sellers
#
#  id                   :integer          not null, primary key
#  name                 :string
#  seller_id            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#
# Indexes
#
#  index_picture_sellers_on_seller_id  (seller_id)
#

class PictureSeller < ActiveRecord::Base
  belongs_to :seller

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
