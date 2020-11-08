class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,      presence: true
         validates :first_name,    presence: true
         validates :second_name,   presence: true
         validates :first_name_k,  presence: true
         validates :second_name_k, presence: true
         validates :birthday,      presence: true
end