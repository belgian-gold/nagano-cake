class ChangePaymentMethodToPaymentMethodInOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :payment_method, :payment_method
  end
end
