class PurchasesController < ApplicationController
  def index
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @user_item = UserItem.new
  end

  def new
  end

  def create
    user = User.create(user_params)
    Residence.create(residence_params(user))
    Purchase.create(purchase_params(user))
    redirect_to action: :index
  end

  private

  def user_params
    params.permit(:name, :name_reading, :nickname)
  end

#   def address_params(user)
#     params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(user_id: user.id)
#   end

#   def investment_params(user)
#     params.permit(:item).merge(user_id: user.id)
#   end
# end

end
