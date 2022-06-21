class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @total_items = Item.count
  end

  def show
     @item = Item.find(params[:id])
     @item_to_cart = OrderDetail.new
  end

  def create
    @item_to_cart = OrderDetail.new(order_detail_params)
    @item_to_cart.save
    redirect_to public_cart_items_path
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:number)
  end
end
