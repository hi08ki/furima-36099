class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to user_session_path(@item.id)
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end 

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :delivery_id, :days_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

end
