class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new 
  before_action :authenticate_user!, only: :create

  def index
    # @items_category = Item.where("buyer_id IS NULL AND trading_status = 0 AND category_id < 200").order(created_at: "DESC")
    # @items_brand = Item.where("buyer_id IS NULL AND  trading_status = 0 AND brand_id = 1").order(created_at: "DESC")
  end

  def new
    @item = Item.new
    # @item.item_imgs.new
    # @category_parent = Category.where(ancestry: nil)
      # 親カテゴリーが選択された後に動くアクション
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
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :delivery_id, :days_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

end
