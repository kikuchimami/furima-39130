FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
  
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name_zenkaku{person.first.hiragana}
    last_name_zenkaku{person.last.hiragana}
    kana_family_name_zenkaku{person.first.katakana}
    kana_last_name_zenkaku{person.last.katakana}
    birthday {Faker::Date.birthday}
  end
end