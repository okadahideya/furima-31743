class ItemsController < ApplicationController
  def index
  end

  def new
    if user_signed_in? 
     @item = Item.new
    else
      render :index
    end
  end

  def create
    @item = Item.new
    if @item.save
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
