class ChangePaymentMethoToPaymentMethodInOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :payment_metho, :payment_method
  end
end
