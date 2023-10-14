FactoryBot.define do
  factory :item do
    image              {Faker::Lorem.sentence}
    name               {"名前"}
    explanation        {"説明"}
    price              {2000}
    category_id        {2}
    status_id          {2}
    shipping_price_id  {2}
    prefecture_id      {2}
    shipping_date_id   {2}
    association :user
  end
end
