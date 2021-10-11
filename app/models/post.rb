class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  # belongs_to :following,class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  # has_many :followings
  # belongs_to :account

  has_many_attached :images
  has_many :comments
  has_many :likes, dependent: :destroy
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 4, message: 'は1枚以上4枚以下にしてください' }
end
