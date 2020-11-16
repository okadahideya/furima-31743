class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :usre
  belongs_to :item
  has_one    :delivery

  validates :token, presence: true
end
