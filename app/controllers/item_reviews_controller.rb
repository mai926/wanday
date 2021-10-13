class ItemReviewsController < ApplicationController 
  before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @review = ItemReview.new
    @item = Item.find(params[:item_id])
  end

  def create
    @review = ItemReview.new(review_params)
    @item = Item.find(params[:item_id])
    if @review.save
      redirect_to item_path(@item)
    else
      render "new"
    end
  end 

  private
  def review_params
    params.require(:item_review).permit(:title, :comment, :rate).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
