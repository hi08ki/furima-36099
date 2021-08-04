class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id]) 
    if @order_address.valid?
      
      # pay_item
      @order_address.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :delivery_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  # def pay_item

  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: @item.price,
  #     card: purchase_params[:token],
  #     currency:'jpy'
  #   )
  #  end

end
