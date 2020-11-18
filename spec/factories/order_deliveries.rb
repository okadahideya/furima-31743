FactoryBot.define do
  factory :order_delivery do
    postal_code          { '123-4567' }
    prefecture_genre_id  { 2 }
    municipality         { '大阪' }
    address              { '2-2' }
    build_name           { '大阪ビル' }
    phone_number         { '08099119911' }
    token                { 'oh_1234567890okada' }
  end
end
