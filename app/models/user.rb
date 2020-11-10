class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6}+\z/i}

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角(漢字）文字を使用してください' } do
    validates :first_name
    validates :second_name
  end
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナ文字を使用してください' } do
    validates :first_name_k
    validates :second_name_k
  end
end
