class Item < ApplicationRecord
  belongs_to :user
  has_many :item_reviews, dependent: :destroy
  has_many_attached :images

  validates :images, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
end
