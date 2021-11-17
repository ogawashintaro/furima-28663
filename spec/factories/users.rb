FactoryBot.define do
  factory :user do
    nickname              {"taro"}
    email                 {Faker::Internet.free_email}
    password              {"1234asdf"}
    password_confirmation {password}
    last_name             {"山田"}
    name                  {"太郎"}
    last_name_kana        {"ヤマダ"}
    name_kana             {"タロウ"}
    birthday              {"2000-01-01"}
  end
end