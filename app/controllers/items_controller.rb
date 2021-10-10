class ItemsController < ApplicationController
  before_action :select_item, only: [:edit, :update]

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
      return redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:explanation,images:[]).merge(user_id: current_user.id)
  end

  def select_item
    @item = Item.find(params[:id])
  end

end
