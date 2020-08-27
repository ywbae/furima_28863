class Comment < ApplicationRecord
  belongs_to :sign_in
  belongs_to :items
end
