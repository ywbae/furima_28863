class Item < ApplicationRecord
  belongs_to :users
  has_many :comments
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  validates :name, :text, :price, :trading_status, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, presence: true

  validates :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }
end

