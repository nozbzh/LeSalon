# == Schema Information
#
# Table name: picture_products
#
#  id                   :integer          not null, primary key
#  product_group_id     :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class PictureProduct < ActiveRecord::Base
  belongs_to :product_group

  has_attached_file :picture,
    styles: {large: "750x500#", medium: "200x200#", thumb: "50x50#" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
