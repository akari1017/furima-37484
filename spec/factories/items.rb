FactoryBot.define do
  factory :item do
    name         { 'あああ' }
    description  { 'あああ' }
    category_id  { '1' }
    status_id    { '1' }
    ship_fee_id  { '1' }
    region_id    { '1' }
    ship_time_id { '1' }
    price        { '1000' }
    user_id      { '1' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end