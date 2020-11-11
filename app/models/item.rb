class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :burden
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_genre_id,        numericality: { other_than: 1 }
    validates :status_genre_id,          numericality: { other_than: 1 }
    validates :delivery_burden_genre_id, numericality: { other_than: 1 }
    validates :prefecture_genre_id,      numericality: { other_than: 1 }
    validates :delivery_days_genre_id,   numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' },
                      numericality: { greater_than: 299, less_than: 10_000_000, message: 'Price Out of setting range' }
  end
end
