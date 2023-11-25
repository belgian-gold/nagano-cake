class Admin::OrdersController < ApplicationController
  def show
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    # if @order.update(order_params)
    #   @order_details.update_all(making_status: "製作待ち") if @order.status == "入金確認"
    # end
    @order.update(order_params)
    if @order.status == "confirmation"
    @order_details.each do |order_detail|
    order_detail.making_status = 1
    order_detail.update(order_detail_params)
  end
    redirect_to admin_order_path(@order)
    end
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
