FactoryBot.define do
  factory :order_address do
    zip       { '123-4567' }
    region_id { '1' }
    city      { '東京都' }
    block     { '品川区1-1' }
    building  { '東京ハイツ' }
    phone     { '09012341234' }
  end
end
