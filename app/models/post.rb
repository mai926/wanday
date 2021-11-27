class Post < ApplicationRecord
  belongs_to :user
  belongs_to :account, class_name: 'Account', foreign_key: 'user_id'
  has_many :likes, dependent: :destroy
  has_many_attached :images
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :followings, class_name: 'User', foreign_key: 'user_id'
  # タグ付機能
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 4, message: 'は1枚以上4枚以下にしてください' }
end
