FactoryBot.define do
  factory :item do
    image                     { Faker::Lorem.sentence }
    name                      { 'テスト' }
    explanation               { 'テスト' }
    category_genre_id         { "2" }
    status_genre_id           { "2" }
    delivery_burden_genre_id  { "2" }
    prefecture_genre_id       { "2" }
    delivery_days_genre_id    { "2" }
    price                     { "10000" }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
