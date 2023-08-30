FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    shipping_area_id { 2 }
    city { '東京都' }
    street_address { '1-1' }
    building_name { 'メゾン一刻' }
    phone_number { 12345678912 }
    token {"tok_abcdefghijk00000000000000000"}


    
  end


end