class Admin::OrdersController < ApplicationController
  def show
  end

  def update
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
