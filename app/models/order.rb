# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  status_order   :string
#  seller_id      :integer
#  bill_client_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_orders_on_bill_client_id  (bill_client_id)
#  index_orders_on_seller_id       (seller_id)
#

class Order < ActiveRecord::Base
  belongs_to :seller
  has_many :order_items, dependent: :destroy
  belongs_to :bill_client
end
