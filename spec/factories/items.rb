FactoryBot.define do
  factory :item do
    item_name            {"item"}
    price                {500}
    information          {"aaaaaa"}
    category_id          {1}
    delivery_fee_id      {2}
    area_id              {3}
    shipping_date_id     {1}
    product_condition_id {1}
    
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
