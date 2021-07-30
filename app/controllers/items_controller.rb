class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :authenticate_user!, only: [:show,:edit,:update]
  before_action :contributor_confirmation, only: :update
  
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
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
  end 

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :delivery_id, :days_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  ef move_to_update
    unless current_user.id == @item.user_id
     redirect_to root_path
    end
end
