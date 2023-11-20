class AddIsMembershipStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_membership_status, :booleam, null: false, default: "true"
  end
end
