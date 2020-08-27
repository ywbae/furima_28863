class Item < ApplicationRecord
  belongs_to :sign_in
  has_one :item_image
  has_many :comments
end
