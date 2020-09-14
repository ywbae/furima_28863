class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if user_signed_in?
      redirect_to root_path unless current_user.id != @item.user_id
    else
      redirect_to root_path
    end
    @order = PaymentForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = PaymentForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    end
    render 'index'
  end

  private

  def order_params
    params.permit(:item_id, :order_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
