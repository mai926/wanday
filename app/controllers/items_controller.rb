class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:explanation,images:[]).merge(user_id: current_user.id)
  end
end
