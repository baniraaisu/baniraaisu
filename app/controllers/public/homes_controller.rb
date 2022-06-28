class Public::HomesController < ApplicationController
  def show
   @items = Item.page(params[:page]).per(3)
  end

  def about
  end
end
