FactoryBot.define do
  factory :purchase do
    postal_code     {"123-4567"}
    area_id         {20}
    municipalities  {"aaaaaa"}
    building_name   {"柳ビル"}
    address         {"123番地"}
    tel             {"09012345678"}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end
