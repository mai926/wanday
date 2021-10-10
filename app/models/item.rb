class Item < ApplicationRecord
  belongs_to :user
  has_many :item_reviews
  has_many_attached :images

  validates :images, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
end
