# == Schema Information
#
# Table name: product_groups
#
#  id                   :integer          not null, primary key
#  name                 :string
#  category_type        :string
#  category_style       :string
#  material             :string
#  dimensions_length_cm :integer
#  dimensions_width_cm  :integer
#  dimensions_height_cm :string
#  description          :text
#  characteristics      :text
#  seller_id            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class ProductGroup < ActiveRecord::Base
  belongs_to :seller
  has_many :product_refs, dependent: :destroy
  has_many :picture_products, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :category_type, presence: true
  validates :category_style, presence: true
  validates :material, presence: true
  validates :dimensions_length_cm, presence: true
  validates :dimensions_width_cm, presence: true
  validates :dimensions_height_cm, presence: true
  validates :description, presence: true
  validates :characteristics, presence: true

  paginates_per 1
end
