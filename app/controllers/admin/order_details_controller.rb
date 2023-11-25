class Admin::OrderDetailsController < ApplicationController
  
    def update
  order_detail = OrderDetail.find(params[:id])
  order_detail.update(order_detail_params)
  case order_detail.is_production_status
  when "製作中"
   order_detail.order.update(status: "製作中")
when "製作完了"
if order_detail.order.order_details.all?{|order_detail| order_detail.is_production_status == "製作完了"}
order_detail.order.update(status: "発送準備中")
  end
end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:is_production_status)
  end

  def order_params
    params.permit(:is_order_status)
  end

end
