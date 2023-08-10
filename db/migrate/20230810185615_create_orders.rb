class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :bar_id
      t.decimal :subtotal, precision: 9, scale: 2
      t.boolean :delivery
      t.decimal :total, precision: 9, scale: 2

      t.timestamps
    end
  end
end
