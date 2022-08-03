FactoryBot.define do
  factory :purchase do
    postal_code     {"123-4567"}
    area_id         {20}
    municipalities  {"abcビル"}
    address         {"123番地"}
    tel             {"09012345678"}
    item_id         {18}
    user_id         {8}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end
