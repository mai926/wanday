class Item < ApplicationRecord
  belongs_to :user
  belongs_to :account, class_name: 'Account', foreign_key: 'user_id'
  has_many :item_reviews, dependent: :destroy
  has_many_attached :images

  validates :images, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
end
