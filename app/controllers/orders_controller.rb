class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    @order = PaymentForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = PaymentForm.new(order_params)
    @order.save
  end

  private

  def order_params
    params.permit(:item_id, :order_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id)
  end
end