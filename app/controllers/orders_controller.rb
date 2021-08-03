class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id]) 
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
   end
#   def address_params(user)
#     params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(user_id: user.id)
#   end

#   def investment_params(user)
#     params.permit(:item).merge(user_id: user.id)
#   end
# end

end
