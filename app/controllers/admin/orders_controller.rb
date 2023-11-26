class Admin::OrdersController < ApplicationController
def index
  @customer = Customer.find(params[:id])
  @orders = Order.where(customer_id: @customer.id).order(created_at: :desc).page(params[:page]).per(10)
end

  def show
    # # @customer = Customer.find(params[:id])
    # @order = Order.find(params[:id])
    # # @item = Item.find(params[:id])
    # @order_items = @order.order_details.all
    # @order_details = @order.order_details.all
    # @total_item_amount = @order_details.sum { |order_detail| order_detail.subtotal }
    # @order = Order.find(params[:id])
    @order =Order.find(params[:id])
    @order_details= OrderDetail.where(order_id: @order.id)
    @order_details = @order.order_details.all

  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)

    if @order.is_order_status == "confirmation"
      @order_details.each do |order_detail|
        order_detail.is_production_status = 1
        # order_detail.is_production_status = params[:order_detail][:is_production_status]
        order_detail.update(order_detail_params)
      end
    end
    redirect_to admin_order_path(@order)
  end

  # private
  # def order_params
  #   params.require(:order).permit(:is_order_status)
  # end

private

  def order_params
    params.require(:order).permit(:is_order_status)
  end

  def order_detail_params
    params.permit(:is_production_status)
  end



end