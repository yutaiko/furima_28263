FactoryBot.define do
  factory :item do
    name                    { "Faker::One_piece.character" }
    description             { "Faker::Text.text" }
    category_id             { 1 }
    condition_id            { 1 }
    shipping_charge_id      { 1 }
    shipping_origin_id      { 1 }
    days_until_shipping_id  { 1 }
    price                   { 10000 }
    association :user
  end
end
