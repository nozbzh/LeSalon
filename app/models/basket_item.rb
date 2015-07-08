# == Schema Information
#
# Table name: basket_items
#
#  id             :integer          not null, primary key
#  quantity       :integer
#  product_ref_id :integer
#  basket_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  price_cents    :integer          default(0), not null
#  reference      :string
#
# Indexes
#
#  index_basket_items_on_basket_id       (basket_id)
#  index_basket_items_on_product_ref_id  (product_ref_id)
#

class BasketItem < ActiveRecord::Base
  belongs_to :product_ref
  belongs_to :basket

  monetize :price_cents
end
