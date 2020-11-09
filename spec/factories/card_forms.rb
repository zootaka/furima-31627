FactoryBot.define do
  factory :card_form do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    municipality { '江東区' }
    building_name { '新東京ビル' }
    phone_number { 11_111_111_111 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
