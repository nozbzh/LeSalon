# == Schema Information
#
# Table name: product_refs
#
#  id                   :integer          not null, primary key
#  product_group_id     :integer
#  color_name           :string
#  promotion_percentage :decimal(, )
#  availability         :string
#  delivery_time        :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  reference            :string
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  image_file_name      :string
#  image_content_type   :string
#  image_file_size      :integer
#  image_updated_at     :datetime
#  price_cents          :integer          default(0), not null
#

class ProductRef < ActiveRecord::Base
  belongs_to :product_group
  has_one :picture_ref
  has_many :basket_items, dependent: :destroy
  has_many :order_items
  validates :color_name, presence: true
  validates :price, presence: true
  validates :promotion_percentage, presence: true
  validates :availability, presence: true
  validates :delivery_time, presence: true
  validates :reference, presence: true, uniqueness: true

  monetize :price_cents

  has_attached_file :picture,
    styles: { thumb: "40x40#" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  has_attached_file :image,
    styles: { large: "750x500#", medium: "200x200#", thumb: "50x50#" }

  validates_attachment_content_type :image,
    content_type: /\Aimage\/.*\z/
end
