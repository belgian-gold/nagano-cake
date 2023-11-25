class Admin::OrdersController < ApplicationController
def index
  end

  def show
     @order =Order.find(params[:id])
     #@order_details= OrderDetail.where(order_id: @order.id)
     @order_details = @order.order_details
  end

  def update
     @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.status == "confirmation"
      @order_details.each do |order_detail|
        order_detail.making_status = 1
        order_detail.update(order_detail_params)
      end
    end
      redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


private

  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.permit(:making_status)
  end


end