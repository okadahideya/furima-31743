class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
       pay_item
       @order_delivery.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.require(:order_delivery).permit(:user_id, :item_id, :postal_code, :prefecture_genre_id,:municipality, :address, :phone_number, :build_name).
    merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
