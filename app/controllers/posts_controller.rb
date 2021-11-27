class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  before_action :select_post, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_show, only: [:edit, :update, :destroy]
  before_action :pet_select, only: [:search]

  def index
    @posts = Post.where(user_id: [*current_user.following_ids]).order('created_at DESC')
    @pet = current_user.pet
  end

  def new
    @post = PostsTagForm.new
  end

  def create
    @post = PostsTagForm.new(post_params)
    if @post.valid?
      @post.save
      redirect_to home_path(current_user)
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      render 'update'
    else
      render 'edit'
    end
  end

  def show
    @comments = @post.comments.includes(:account)
    @comment = Comment.new
    @account = @post.account
  end

  def destroy
    if @post.destroy
      redirect_to home_path(current_user)
    else
      render 'show'
    end
  end

  def search
    if params[:q]&.dig(:caption)
      squished_keywords = params[:q][:caption].squish
      params[:q][:caption_cont_any] = squished_keywords.split(' ')
    end
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  private

  def post_params
    params.require(:posts_tag_form).permit(:caption, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def select_post
    @post = Post.find(params[:id])
  end

  def pet_select
    @pet = current_user.pet
  end

  def redirect_to_show
    return redirect_to root_path if current_user.id != @post.user.id
  end
end
