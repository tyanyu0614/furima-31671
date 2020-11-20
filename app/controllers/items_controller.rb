class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :baria_user, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show]


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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:price,:condition_id,:delivery_fee_id,:shipping_area_id,:day_id,:category_id).merge(user_id: current_user.id)
  end

  def baria_user
    @item = Item.find(params[:id])
    unless current_user == @item.user
    redirect_to root_path 
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

