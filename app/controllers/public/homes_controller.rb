class Public::HomesController < ApplicationController
  def show
   @items = Item.all
  end

  def about
  end
end
