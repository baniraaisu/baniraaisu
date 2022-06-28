class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :number
      t.integer :tax_on_price
      t.integer :making_status

      t.timestamps
    end
  end
end
