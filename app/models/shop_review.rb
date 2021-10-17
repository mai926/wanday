class ShopReview < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :account, class_name: 'Account', foreign_key: 'user_id'

  validates :title, presence: true
  validates :comment, presence: true
end
