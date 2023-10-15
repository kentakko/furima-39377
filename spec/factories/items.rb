FactoryBot.define do
  factory :item do
    name               { '名前' }  
    price              { '2000' }
    explanation        { '説明' }
    category_id        { 2 }
    status_id          { 2 }
    shipping_price_id  { 2 }
    prefecture_id      { 2 }
    shipping_date_id   { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
