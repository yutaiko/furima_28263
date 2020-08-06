FactoryBot.define do
  factory :item do
    name                    { Faker::JapaneseMedia::DragonBall.character }
    description             { Faker::JapaneseMedia::OnePiece.akuma_no_mi }
    category_id             { 1 }
    condition_id            { 1 }
    shipping_charge_id      { 1 }
    shipping_origin_id      { 1 }
    days_until_shipping_id  { 1 }
    price                   { 10000 }
    association :user
  end
end
