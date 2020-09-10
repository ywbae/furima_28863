class Order < ApplicationRecord
  belongs_to :users
  belongs_to :items
  has_one :shipping_address
end
