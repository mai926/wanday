class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :post_select!, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
  end

  private
  def post_select
    @post = Post.find(params[:post_id])
  end
end
