FactoryBot.define do
  factory :item do
    name         { 'あいうえお' }
    description  { 'あいうえお' }
    category_id  { '2' }
    status_id    { '2' }
    ship_fee_id  { '2' }
    region_id    { '2' }
    ship_time_id { '2' }
    price        { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end