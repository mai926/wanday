class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :select_post, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_show, only: [:edit, :update, :destroy]

  def index
    # @user = User.find(params[:id])
    # @posts = current_user.following_ids.push(current_user.id)
    @follows = current_user.followings.order('created_at DESC')
    # return redirect_to home_path(current_user) if current_user.id != @user.user_id

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

  def show
    @comments = @post.comments.includes(:account)
    @comment = Comment.new
    @account = Account.find(params[:id])
  end

  def destroy
    if @post.destroy
      redirect_to home_path(current_user)
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
