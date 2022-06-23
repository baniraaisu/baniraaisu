class Public::HomesController < ApplicationController
  def show
   @items = Item.page(params[:page])
  end

  def about
  end
end
