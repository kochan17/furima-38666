FactoryBot.define do
  factory :item do
    item_name             { 'エアリアル' }
    description           { '機動戦士' }
    price                 { 2480 }
    condition_id          { 2 }
    category_id           { 2 }
    shipping_fee_bearer_id   { 2 }
    prefecture_id            { 2 }
    shipping_estimate_id     { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpeg')
    end
  end
end