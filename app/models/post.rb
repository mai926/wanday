class Post < ApplicationRecord
  belongs_to :user
  # belongs_to :account

  has_many_attached :images
  has_many :comments
  validates :images, presence: true
  validates :images,length: { minimum: 1, maximum: 4, message: "は1枚以上4枚以下にしてください" }

end
