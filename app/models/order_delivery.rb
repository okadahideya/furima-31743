class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_genre_id, :municipality, :address, :phone_number, :build_name
 
  with_options presence: true do
    validates  :postal_code
    validates  :prefecture_genre_id
    validates  :municipality
    validates  :address
    validates  :phone_number 
  end
  validates :token, presence: true
  def save
    delivery.create(postal_code: postal_code, prefecture_genre_id: prefecture_genre_id, municipality: municipality, address: address, phone_number: phone_number)
  end
end