class Public::ShippingAdressesController < ApplicationController
  def index
    @shipping_addresses = ShippingAdress.new
  end
  
  def create
    @shipping_addresses = ShippingAdress.new()
  end

  def edit
  end
end
