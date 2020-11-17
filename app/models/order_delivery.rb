class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_genre_id, :municipality, :address, :phone_number, :build_name
 
  with_options presence: true do
    validates  :postal_code
    validates  :prefecture_genre_id
    validates  :municipality
    validates  :address
    validates  :phone_number 
    validates  :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(order_id: order.id, postal_code: postal_code, prefecture_genre_id: prefecture_genre_id, municipality: municipality, address: address, phone_number: phone_number)
  end
end