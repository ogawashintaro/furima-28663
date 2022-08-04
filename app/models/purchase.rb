class Purchase
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :address, :building_name, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ , message: "is invalid. Include hyphen(-)" }
    validates :area_id,     numericality: { other_than: 0 , message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :tel,         format: { with: /\A0[0-9]{9,10}\z/ , message: "It is invalid. No hyphen required" }
    validates :item_id
    validates :user_id
    validates :token
  end


  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id) 
    Address.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, tel: tel, buyer_id: buyer.id)
  end
end

