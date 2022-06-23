class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def success
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:adress_name, :address, :total_amount)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end

end
