class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_genre_id,        numericality: { other_than: 1 }
    validates :status_genre_id,          numericality: { other_than: 1 }
    validates :delivery_burden_genre_id, numericality: { other_than: 1 }
    validates :prefecture_genre_id,      numericality: { other_than: 1 }
    validates :delivery_days_genre_id,   numericality: { other_than: 1 }
    validates :price
  end
end
