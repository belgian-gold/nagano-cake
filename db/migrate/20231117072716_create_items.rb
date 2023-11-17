class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id,        null: false, default: ""
      t.string :name,             null: false, default: ""
      t.text :name_explanation,   null: false, default: ""
      t.boolean :is_sales_status, null: false, default: true
      t.integer :price,           null: false, default: ""

      t.timestamps
    end
  end
end
