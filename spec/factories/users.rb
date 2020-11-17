FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    
    password {"111111a"}
    password_confirmation {"111111a"}
    first_name {"太郎"}
    last_name{"玉田"}
    kana_first{"タロウ"}
    kana_last{"タマダ"}
    birth_day{"1902-09-08"}
  end
end