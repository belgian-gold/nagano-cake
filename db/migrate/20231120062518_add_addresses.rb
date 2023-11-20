class AddAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :address, :string, null: false, default: ""
  end
end
