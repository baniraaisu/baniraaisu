class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(3)
    @total_items = Item.count
  end

  def show
     @item = Item.find(params[:id])
     @cart_item =  CartItem
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

  def item_params
    params.require(:items).permit( :genre_id, :name, :introduction, :tax_off_price)
  end
end
