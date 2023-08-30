class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]

  # ここにバリデーションの処理を書く

  def index
    @order_address = OrderAddress.new
    Payjp.api_key = ENV["PAYJP_PUBLIC_KEY"]
    return redirect_to root_path if @item.order.present? || current_user == @item.user
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
       @order_address.save
       redirect_to root_path
    else
      Payjp.api_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :shipping_area_id, :city, :street_address, :building_name, :phone_number, ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
   
  def item_find
    @item = Item.find(params[:item_id])
  end

  
end
