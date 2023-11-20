class AddPostalCodeTelephoneNumber < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :postal_code, :string, null: false, default: ""
    add_column :customers, :telephone_number, :string, null: false, default: ""
  end
end
