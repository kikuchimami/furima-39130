FactoryBot.define do
  factory :item do
    product_name              {Faker::Name.initials(number: 2)}
    explanation               {"テスト"}
    price                     { "5000" }
    category_id               { "3" }
    condition_id              { "2" }
    shipping_charge_id        { "2" }
    shipping_area_id          { "2" }
    shipping_date_id          { "2" }
    association :user

    after(:build) do |message|
      message.item_image.attach(io: File.open('public/images/DSC_1168.JPG'), filename: 'DCS_1168.JPG')
    end
  end
end
