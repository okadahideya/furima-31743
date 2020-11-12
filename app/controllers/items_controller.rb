class ItemsController < ApplicationController
  def index
    @item = Item.all.order(created_at: :desc)
    
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      render :index
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_genre_id, :status_genre_id, :delivery_burden_genre_id, :prefecture_genre_id, :delivery_days_genre_id, :price).merge(user_id: current_user.id)
  end
end
