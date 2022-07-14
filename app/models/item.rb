class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :shipping_date
  belongs_to :product_condition

  has_one_attached :image

  validates :item_name,            presence: true
  validates :information,          presence: true
  validates :category_id,          presence: true
  validates :delivery_fee_id,      presence: true
  validates :area_id,              presence: true
  validates :shipping_date_id,     presence: true
  validates :product_condition_id, presence: true
  validates :image,                presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "Price can't be blank" }
  end


  belongs_to :user
  # has_one :buyer
end
