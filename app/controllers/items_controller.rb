class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only:[:show,:edit,:update,:destroy]
  before_action :set_items, only:[:edit, :update]
  before_action :contributor_confirmation, only: [:edit,:update,:destroy]
  
  
  
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
    @comment = Comment.new
    @comments = @item.comments.order(created_at: :desc)
  end 

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
 
  def destroy
    @item.destroy 
    redirect_to root_path
   end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :delivery_id, :days_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_items
    redirect_to root_path if @item.order.present?
  end

  def contributor_confirmation
    unless current_user.id == @item.user_id
     redirect_to root_path
    end
  end
end
