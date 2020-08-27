class SignIn < ApplicationRecord
  belongs_to :users
  has_many :items
  has_many :comments
end
