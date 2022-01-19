class PostsTagForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :images, :caption, :user_id, :tag_name, :id, :created_at, :updated_at

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 4, message: 'は1枚以上4枚以下にしてください' }

  def save(tag_list)
    post = Post.new(caption: caption, user_id: user_id, images: images)
    if tag_name.present?
      tag_list.each do |tag_name|
        tag = Tag.where(name: tag_name).first_or_initialize
        post.tags << tag
      end
    end
    post.save
  end

  def update(params, post)
    tag_name = params.delete(:tag_name)
    tag = Tag.where(name: tag_name).first_or_initialize if tag_name.present?
    ActiveRecord::Base.transaction do
      tag.save if tag_name.present?
      post.update!(params)
      post.post_tag_relations.destroy_all
      post.tags << tag if tag_name.present?
      return true
    end
    rescue => e

      tag.errors.messages[:tag_name] = tag.errors.messages.delete(:name) if tag&.errors&.messages&.present?
      post&.errors&.messages&.each do |key, message|
        self.errors.add(key, message.first)
      end
      tag&.errors&.messages&.each do |key, message|
        self.errors.add(key, message.first)
      end
      return false
  end

end
