# == Schema Information
#
# Table name: sellers
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  description_short      :text
#  description            :text
#  phone                  :string
#  address_street         :string
#  address_zip            :string
#  address_city           :string
#  address_country        :string
#  latitude               :float
#  longitude              :float
#  approved               :boolean          default(FALSE), not null
#
# Indexes
#
#  index_sellers_on_approved              (approved)
#  index_sellers_on_email                 (email) UNIQUE
#  index_sellers_on_reset_password_token  (reset_password_token) UNIQUE
#

class Seller < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :picture_sellers, dependent: :destroy
  has_many :product_groups, dependent: :destroy
  has_many :product_refs, through: :product_groups
  has_many :orders
  has_many :order_items, through: :orders

  validates :email, presence: true, uniqueness: true, format: { with: /\A^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})\z/ }
  validates :name, presence: true, uniqueness: true
  validates :description_short, presence: true
  validates :description, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :address_street, presence: true
  validates :address_zip, presence: true
  validates :address_city, presence: true
  validates :address_country, presence: true
  # put regexp for all things like addresses


  geocoded_by :full_address
  after_validation :geocode, if: ->(seller){
    seller.address_street.present? && seller.address_street_changed?
    seller.address_zip.present? && seller.address_zip_changed?
    seller.address_city.present? && seller.address_city_changed?
    seller.address_country.present? && seller.address_country_changed?
  }

  def full_address
    "#{address_street} #{address_zip} #{address_city} #{address_country}"
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

end
