class Item < ApplicationRecord
  belongs_to :users, optional: true
  has_many :comments
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  validates :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 0 }

  validates :name, :text, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999_999, message: '設定可能な範囲を超えています' }

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
