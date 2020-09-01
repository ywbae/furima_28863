FactoryBot.define do
  factory :item do
    association :user, factory: :user
    image { File.open("#{Rails.root}/public/images/test_image.png") }
    name                  { Faker::Lorem.sentence }
    text                  { Faker::Lorem.sentence }
    price                 { 5000 }
    category_id           { 3 }
    sales_status_id       { 3 }
    shipping_fee_id       { 3 }
    prefecture_id         { 3 }
    scheduled_delivery_id { 3 }
  end
end
