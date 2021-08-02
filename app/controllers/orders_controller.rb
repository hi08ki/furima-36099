class OrdersController < ApplicationController
  def index
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @orders = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(order_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:product_name, :price, :burden_id, :image)
  end

#   def address_params(user)
#     params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(user_id: user.id)
#   end

#   def investment_params(user)
#     params.permit(:item).merge(user_id: user.id)
#   end
# end

end
