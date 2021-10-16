class ItemReview < ApplicationRecord
  belongs_to :user
  belongs_to :account, class_name: 'Account', foreign_key: 'user_id'
  belongs_to :item

  validates :title, presence: true
  validates :comment, presence: true
end
