class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order = CardForm.new
    redirect_to root_path if @item.purchase
  end

  def create
    @item = Item.find(params[:item_id])
    @order = CardForm.new(set_params)
    if @order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: set_params[:token], # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_params
    params.require(:card_form).permit(:post_code, :prefecture_id, :city, :municipality, :building_name, :phone_number).merge(token: params[:token]).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end
end
