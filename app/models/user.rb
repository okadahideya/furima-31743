class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角(漢字）文字を使用してください' }
    validates :second_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角(漢字）文字を使用してください' }
    validates :first_name_k, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナ文字を使用してください' }
    validates :second_name_k, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナ文字を使用してください' }
  end
end
