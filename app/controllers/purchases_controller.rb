class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_address = UserAddress.new  #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  
  def create
    @item = Item.find(params[:item_id])
    @user_address =UserAddress.new(address_params)
    @user_address.save
      if  @user_address.valid?
          redirect_to root_path
      else
          render :index
      end
  end


  private

  def address_params
    params.require(:user_address).permit(:postal_code,:prefecture_id, :municipalities, :address_number, :building_name,:phone_number).merge(user_id: current_user.id,item_id:params[:item_id])
   end
end
