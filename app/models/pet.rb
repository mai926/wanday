class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :account, class_name: 'Account', foreign_key: 'user_id'
  has_many_attached :images
end
