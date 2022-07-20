class Purchase
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :address, :building_name, :tel

  with_options presence: true do
    validates :postal_code format: { with: ^\d{3}-\d{4}$ }
    validates :area_id
    validates :municipalities
    validates :address
    validates :tel         format: { with: ^0[789]0\d{8}$ }
  end
end