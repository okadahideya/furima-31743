class Delivery < ApplicationRecord
  belongs_to :order
  
  validates :build_name
  with_options presence: true do
    validates  :postal_code
    validates  :prefecture_genre_id
    validates  :municipality
    validates  :address
    validates  :phone_number 
    validates  :order
  end
end
