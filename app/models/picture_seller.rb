# == Schema Information
#
# Table name: picture_sellers
#
#  id         :integer          not null, primary key
#  name       :string
#  seller_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_picture_sellers_on_seller_id  (seller_id)
#

class PictureSeller < ActiveRecord::Base
  belongs_to :seller
end
