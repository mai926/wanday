require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿機能' do
    context '投稿できる時' do
      it '全て正常' do
        expect(@post).to be_valid
      end
    end

    context '投稿できない時' do
      it 'images:必須' do
        @post.images = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Images can't be blank")
      end
      it 'user:必須' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
