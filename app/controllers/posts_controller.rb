class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :select_post, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_show, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render 'create'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      render 'update'
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      return redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, images: []).merge(user_id: current_user.id)
  end

  def select_post
    @post = Post.find(params[:id])
  end

  def redirect_to_show
    return redirect_to root_path if current_user.id != @post.user.id
  end
end
