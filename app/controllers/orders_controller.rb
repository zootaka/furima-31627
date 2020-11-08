class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = CardForm.new
  end

  def create
    @purchase = CardForm.new(set_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def set_params
    params.permit(:purchase, :address)
  end
  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end
end
