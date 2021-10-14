class ShopReview < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :title, presence: true
  validates :comment, presence: true
end
