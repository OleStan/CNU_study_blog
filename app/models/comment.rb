class Comment < ApplicationRecord
  belongs_to :post

  validates :comment, length: { minimum: 5 }
end
