class AddLastNameAndFirstNameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_name, :string, null: false, default: ""
    add_column :customers, :first_name, :string, null: false, default: ""
  end
end
