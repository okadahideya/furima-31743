class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:postal_code, :prefecture_genre_id, :municipality, :address, :phone_number, :build_name],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.permit(:postal_code, :prefecture_genre_id, :municipality, :address, :phone_number, :build_name).merge(order_id: current_user.id, token: params[:token])
  end

end
