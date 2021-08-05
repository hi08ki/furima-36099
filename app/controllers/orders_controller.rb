class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only:[:index, :create]
  before_action :sold_out_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    # binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :delivery_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
   end

  def pay_item
    Payjp.api_key = "sk_test_5cfd7c2d7da07e8060d4f155"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
   end

end
