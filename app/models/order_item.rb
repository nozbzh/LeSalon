# == Schema Information
#
# Table name: order_items
#
#  id             :integer          not null, primary key
#  quantity       :integer
#  order_id       :integer
#  product_ref_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  price_cents    :integer          default(0), not null
#
# Indexes
#
#  index_order_items_on_order_id        (order_id)
#  index_order_items_on_product_ref_id  (product_ref_id)
#

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product_ref

  monetize :price_cents
end
