class Admin::OrderDetailsController < ApplicationController
  def update
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

  def order_params
    params.permit(:status)
  end

end
