FactoryBot.define do
  factory :user do
    nickname              {"taro"}
    email                 {Faker::Internet.free_email}
    encrypted_password    {"000000"}
    password_confirmation {encrypted_password}
    last_name             {"山田"}
    name                  {"太郎"}
    last_name_kana        {"ヤマダ"}
    name_kana             {"タロウ"}
    birthday              {"2000-01-01"}
  end
end