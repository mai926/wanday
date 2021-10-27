class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :account, class_name: 'Account', foreign_key: 'user_id'
  has_one_attached :image

  validates :image, :name, :dog_breed, :birthday, :favorite, :character, presence: true
end
