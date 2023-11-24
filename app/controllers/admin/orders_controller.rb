class Admin::OrdersController < ApplicationController
def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    # @customer = Customer.find(params[:id])
    @order_details = @order.order_details
    @postage = 800
    @subtotal = @order.total_payment - @postage
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @order.update(order_params)

    if @order.status == "confirm_payment"
       @order_details.update(production_status:'waiting_for_production')
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
