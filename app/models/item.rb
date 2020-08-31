class Item < ApplicationRecord
  belongs_to :users
  has_many :comments
  has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
end
