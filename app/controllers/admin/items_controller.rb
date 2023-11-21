class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "登録が完了いたしました"
      redirect_to admin_items_path(@item)
    else
      render :new
    end
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
    params.require(:item).permit(:item_image, :name, :name_explanation, :genre_id, :price, :is_sales_status)
  end

end
