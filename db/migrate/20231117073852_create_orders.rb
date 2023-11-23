class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id,     null: false, default: ""
      t.integer :payment_method,   null: false, default: 0
      t.integer :total_price,     null: false, default: ""
      t.integer :postage,         null: false, default: ""
      t.string  :addres,          null: false, default: ""
      t.string  :postal_code,     null: false, default: ""
      t.string  :name,            null: false, default: ""
      t.integer :is_order_status, null: false, default: 0

      t.timestamps
    end
  end
end
