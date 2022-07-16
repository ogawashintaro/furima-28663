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
  validates :category_id,          numericality: { other_than: 0 , message: "can't be blank"}
  validates :delivery_fee_id,      numericality: { other_than: 0 , message: "can't be blank"}
  validates :area_id,              numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_date_id,     numericality: { other_than: 0 , message: "can't be blank"}
  validates :product_condition_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :image,                presence: true
  
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "Price can't be blank" }
  end


  belongs_to :user
  # has_one :buyer
end
