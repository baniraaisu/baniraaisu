class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
  end

  def success
  end

  def index
  end

  def show
  end

  def check
    @order.pay_method = params[:pay_method]
    @order.postage = 800
    @order.total_amount = current_customer.total_amount + @order.postage

    case @adress_option = params[:adress_option].to_i
    when 1
      @order.post_code = current_customer.post_code
      @order.adress = current_customer.adress
      @order.adress_name = current_customer.first_name+current_customer.last_name
    when 2
      @shipping = params[:order][:select_adress].to_i
      @set_adress = ShippingAdress.find(@shipping)
      @order.post_code = @set_adress.post_code
      @order.adress = @set_adress.adress
      @order.adress_name = @set_adress.adress_name

      @order
    when 3
      if @order.save
        redirect_to  new_public_order_path
      else
        render :new
      end
    end

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :pay_method, :adress_name, :post_code, :adress, :status, :postage, :total_amount)
  end
end
