class Order < ApplicationRecord
  belongs_to :usre
  belongs_to :item
  has_one    :delivery
end
