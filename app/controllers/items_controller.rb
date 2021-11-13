class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :select_item, only: [:edit, :update, :show, :destroy]
  before_action :pet_select, only: [:index, :show, :search]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def show
    @review = @item.item_reviews
    @average_review = @review.average(:rate)
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render 'show'
    end
  end

  def search
    if params[:q]&.dig(:name)
      squished_keywords = params[:q][:name].squish
      params[:q][:name_cont_any] = squished_keywords.split(' ')
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, images: []).merge(user_id: current_user.id)
  end

  def pet_select
    @pet = current_user.pet
  end

  def select_item
    @item = Item.find(params[:id])
  end
end
