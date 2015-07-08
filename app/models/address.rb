# == Schema Information
#
# Table name: addresses
#
#  id                      :integer          not null, primary key
#  delivery_address_street :string
#  delivery_address_zip    :string
#  delivery_address_city   :string
#  user_id                 :integer
#  bill_client_id          :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_addresses_on_bill_client_id  (bill_client_id)
#  index_addresses_on_user_id         (user_id)
#

class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill_client
  validates :delivery_address_street, presence: true
  validates :delivery_address_zip, presence: true
  validates :delivery_address_city , presence: true
end
