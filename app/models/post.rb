class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many_attached :images
  has_many :comments
  has_many :likes, dependent: :destroy
  
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 4, message: 'は1枚以上4枚以下にしてください' }
end
