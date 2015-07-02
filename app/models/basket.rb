# == Schema Information
#
# Table name: baskets
#
#  id         :integer          not null, primary key
#  status     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_baskets_on_user_id  (user_id)
#

class Basket < ActiveRecord::Base
  belongs_to :user
  has_many :basket_items
end
