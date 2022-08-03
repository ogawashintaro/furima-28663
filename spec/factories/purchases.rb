FactoryBot.define do
  factory :purchase do
    postal_code     {"123-4567"}
    area_id         {20}
    municipalities  {"aaaaaa"}
    building_name   {""}
    address         {"123番地"}
    user_id         {  }
    item_id         {  }
    tel             {"09012345678"}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end
