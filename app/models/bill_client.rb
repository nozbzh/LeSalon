# == Schema Information
#
# Table name: bill_clients
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :string
#  amount_cents :integer          default(0), not null
#  payment      :json
#
# Indexes
#
#  index_bill_clients_on_user_id  (user_id)
#

class BillClient < ActiveRecord::Base
  belongs_to :user
  has_one :address
  has_many :orders

  monetize :amount_cents
  # has_one :address

  def sent?
    orders.where(status_order: "sent").count == orders.count
  end
end
