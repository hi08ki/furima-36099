class ItemsController < ApplicationController
  
  def index
    @items_category = Item.where("buyer_id IS NULL AND trading_status = 0 AND category_id < 200").order(created_at: "DESC")
    @items_brand = Item.where("buyer_id IS NULL AND  trading_status = 0 AND brand_id = 1").order(created_at: "DESC")
  end

  def new
    @item = Item.new
    @item.item_imgs.new
    @category_parent = Category.where(ancestry: nil)
      # 親カテゴリーが選択された後に動くアクション
    def get_category_child
      @category_child = Category.find("#{params[:parent_id]}").children
      render json: @category_child
      #親カテゴリーに紐付く子カテゴリーを取得
  end
  def get_category_grandchild
    @category_grandchild = Category.find("#{params[:child_id]}").children
    render json: @category_grandchild
    #子カテゴリーに紐付く孫カテゴリーの配列を取得
  end
end
  
  def create
    @item = Item.new(item_params)
    unless @item.valid?
      @item.item_imgs.new
      render :new and return
    end

    @item.save
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:user, :product_name, :discription, :category_id, :status_id, :burden_id, :delivery_id, :days_delivery_id, :price, [:url, :id]).merge(seller_id: current_user.id)
  end

end
