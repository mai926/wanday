class HomeController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @account = Account.find(params[:id])
    @likes = @user.likes
    # @post = Post.find(params[:id])
    @following_users = @user.followings
    @follower_users = @user.followers
  end

  def like_list
    @user = User.find(params[:id])
    @account = Account.find(params[:id])
    @likes = @user.likes
  end

  def follower
    @user = User.find(params[:id])
    @follower_users = @user.followers
  end
end
