class Order < ApplicationRecord
  belongs_to :users
  has_one :shipping_address
end
