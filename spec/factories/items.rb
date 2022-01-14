FactoryBot.define do
  factory :item do
    item_name            {"item"}
    price                {"300"}
    information          {"aaaaaa"}
    category_id          {"レディース"}
    delivery_fee_id      {"出品者負担"}
    area_id              {"青森"}
    shipping_date_id     {"1~3日"}
    product_condition_id {"新品、未使用"}
    user_id              {3}
  end
end
