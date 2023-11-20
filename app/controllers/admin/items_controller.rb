class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
    @order_detail = OrderDetail.find_by(item_id: @item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private
  def item_params
    params.require(:item).permit(:item_image, :name, :explanation, :genre_id, :price, :is_sales_status)
  end

end
