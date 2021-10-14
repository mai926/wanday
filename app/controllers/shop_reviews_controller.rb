class ShopReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @review = ShopReview.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @review = ShopReview.new(review_params)
    @shop = Shop.find(params[:shop_id])
    if @review.save
      redirect_to shop_path(@shop)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:shop_review).permit(:title, :comment, :rate).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
