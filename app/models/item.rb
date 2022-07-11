class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :shipping_date
  belongs_to :product_condition

  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}

  has_one_attached :image

  validates :item_name,            presence: true
  validates :price,                presence: true, format: { with: /\A[0-9]+\z/ }
  validates :information,          presence: true
  validates :category_id,          presence: true
  validates :delivery_fee_id,      presence: true
  validates :area_id,              presence: true
  validates :shipping_date_id,     presence: true
  validates :product_condition_id, presence: true
  validates :user_id,              presence: true

  # belongs_to :user
  # has_one :buyer
end
