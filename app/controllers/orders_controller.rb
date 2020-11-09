class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:create, :index]


  def index
    if current_user.id == @item.user_id || @item.purchase
      redirect_to root_path
    else
      @order = CardForm.new
    end
  end

  def create
    @order = CardForm.new(set_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_params
    params.require(:card_form).permit(:post_code, :prefecture_id, :city, :municipality, :building_name, :phone_number).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: set_params[:token],
      currency:'jpy'
    )
  end
  
end
