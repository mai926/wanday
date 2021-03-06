class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :select_shop, only: [:edit, :update, :show, :destroy]
  before_action :pet_select, only: [:index, :show, :search]
  def index
    @shops = Shop.order(created_at: :desc)
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path
    else
      render 'new'
    end
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render 'edit'
    end
  end

  def show
    @review = @shop.shop_reviews
    @average_review = @review.average(:rate)
  end

  def destroy
    if @shop.destroy
      redirect_to shops_path
    else
      render 'show'
    end
  end

  def search
    if params[:q]&.dig(:name)
      squished_keywords = params[:q][:name].squish
      params[:q][:name_cont_any] = squished_keywords.split(' ')
    end
    @q = Shop.ransack(params[:q])
    @shops = @q.result
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :explanation, images: []).merge(user_id: current_user.id)
  end

  def pet_select
    @pet = current_user.pet
  end

  def select_shop
    @shop = Shop.find(params[:id])
  end
end
