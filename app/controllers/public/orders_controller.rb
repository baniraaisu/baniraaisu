class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to public_order_path(@order)
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
    params.require(:order).permit(:customer_id, :pay_method, :adress_name, :post_code, :adress, :status, :postage, :total_amount)
  end
end
