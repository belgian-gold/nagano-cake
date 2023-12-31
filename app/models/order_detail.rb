class OrderDetail < ApplicationRecord

  belongs_to :item
  # orderdetailはitemに対して一つのみ

  belongs_to :order
  #orderdetailはorderに対して一つのみ

  enum is_production_status: { cannot_start: 0, waiting: 1, production: 2, completed: 3 }
  # enum is_production_status: { "着手不可":0, "製造待ち":1, "製造中":2, "製造完了":3 }

  # def production_status_label
  #   I18n.t("enums.order_detail.is_production_status.#{is_production_status}")
  # end

  #orderdetailのカラムにあるpriceとamountを掛けて税込価格を求める
  def subtotal
    price * amount
  end
end
