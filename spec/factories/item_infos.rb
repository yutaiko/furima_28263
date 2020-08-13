FactoryBot.define do
  factory :item_info do
    postcode             { "254-0077" }
    prefecture_id        { 5 }
    city                 { "平塚市" }
    block                { "東中原110-119" }
    building             { "水公園" }
    phone_number         { "09011001199" }
    stock                { 1 }
    user_id              { 1 }
    item_id              { 2 }
  end
end
