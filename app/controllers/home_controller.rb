class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :user_select, except: [:index]

  def show
    @account = Account.find(params[:id])
    @likes = @user.likes
    # @post = Post.find(params[:id])
  end

  def like_list
    @account = Account.find(params[:id])
    @likes = @user.likes
  end

  def follower
    @follower_users = @user.followers
  end

  def following
    @following_users = @user.followings
  end

  private
    def user_select
      @user = User.find(params[:id])
    end
end
