class PostsTagForm

  include ActiveModel::Model
  attr_accessor :images, :caption, :user_id, :tag_name

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 4, message: 'は1枚以上4枚以下にしてください' }

  def save
    post = Post.new(caption: caption, user_id: user_id, images: images)
    if self.tag_name.present?
      tag = Tag.where(name: self.tag_name).first_or_initialize
      post.tags << tag
    end    
    post.save
  end
end