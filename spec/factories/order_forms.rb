FactoryBot.define do
  factory :order_form do
    post_code       { '123-4567' }
    prefecture_id   { 2 }
    city            { '東京都' }
    address         { '千代田区' }
    building_name   { '皇居ビル' }
    phone_number    { '09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end