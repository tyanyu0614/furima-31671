class PurchasesController < ApplicationController
  before_action :baria_user, only: [:index]
  before_action :set_purchase, only: [:index,:create,]

  def index
    @user_address = UserAddress.new  #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  
  def create
    @user_address =UserAddress.new(address_params)
    if  @user_address.valid?
        pay_item
        @user_address.save
        redirect_to root_path
    else
        render :index
    end
  end


  private

  #ストロングパラメーター
  def address_params
    params.require(:user_address).permit(:postal_code,:prefecture_id, :municipalities, :address_number, :building_name,:phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def baria_user
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchase  != nil
    redirect_to root_path 
    end
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  
end
