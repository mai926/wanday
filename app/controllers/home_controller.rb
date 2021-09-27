class HomeController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    # @post = Post.find(params[:id])
  end
end
