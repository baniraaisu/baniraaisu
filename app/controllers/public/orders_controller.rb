class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if@order.save
    redirect_to public_order(@order)
    else
      render :new
    end
  end

  def success

  end

  def index
  end

  def show
  end

  private
  def order_params
    params.requier(:order).permit(:customer_id, :pay_method, :adress_name, :post_code, :adress, :status, :postage, :total_amount)
  end
end
