class Public::ShippingAdressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @shipping_adresses = ShippingAdress.all
    @shipping_adress = ShippingAdress.new
  end

  def create
    @shipping_adresses = ShippingAdress.all
    @shipping_adress = current_customer.shipping_adresses.new(shipping_adress_params)
    if @shipping_adress.save
    redirect_to request.referrer
    else
      render 'index'
    end
  end

  def edit
    @shipping_adress = ShippingAdress.find(params[:id])
  end

  def update
    @shipping_adress = ShippingAdress.find(params[:id])
    @shipping_adress.update(shipping_adress_params)
    redirect_to public_shipping_adresses_path
  end

  def destroy
    @shipping_adress = ShippingAdress.find(params[:id])
    @shipping_adress.destroy
    redirect_to request.referrer
  end

  private
  def shipping_adress_params
    params.require(:shipping_adress).permit(:customer_id, :post_code, :adress, :adress_name)
  end
end
