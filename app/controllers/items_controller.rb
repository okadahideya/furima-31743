class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  def destroy
    if @item.destroy
    redirect_to root_path 
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_genre_id, :status_genre_id, :delivery_burden_genre_id, :prefecture_genre_id, :delivery_days_genre_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user.id
    redirect_to action: :index 
    end
  end
end
