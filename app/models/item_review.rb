class ItemReview < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :title, presence: true
  validates :comment, presence: true
end
