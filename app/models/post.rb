class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :images, presence: true
  validates :images,length: { minimum: 1, maximum: 4, message: "は1枚以上4枚以下にしてください" }

end
