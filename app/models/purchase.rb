class Purchase
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :address, :building_name, :tel, :item_id, :user_id

  with_options presence: true do
    validates :postal_code format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id     numericality: { other_than: 0 , message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :tel         format: { with: ^0[789]0\d{8}$ , message: "It is invalid. No hyphen required" }
    validates :item_id
    validates :user_id
  end

  def save
    item = Item.create(item_name: item_name, information: information, category_id: category_id, product_condition_id: product_condition_id, delivery_fee_id: delivery_fee_id, area_id: area_id, shipping_date_id: shipping_date_id, price: price)
    user = User.create(nickname: nickname, email: email, password: password, password_confirmation: password_confirmation, last_name: last_name, name: name, last_name_kana: last_name_kana, name_kana: name_kana, birthday: birthday)
    Address.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, tel: tel, user_id: user.id)
    Buyer.create(item_id: item.id, user_id: user.id)
  end
end