class Order < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :items, optional: true
  has_one :shipping_address
end
