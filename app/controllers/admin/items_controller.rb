class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @genre = Genre.all
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item)
    else
    render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :image, :name, :introduction, :tax_off_price, :selling_status)
  end


end