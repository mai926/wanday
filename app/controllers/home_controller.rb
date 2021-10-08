class HomeController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @account = Account.find(params[:id])
    @likes = @user.likes
    # @post = Post.find(params[:id])
  end

  def like_list
    @user = User.find(params[:id])
    @account = Account.find(params[:id])
    @likes = @user.likes
  end
end
