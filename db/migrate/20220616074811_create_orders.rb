class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :pay_method
      t.string :adress_name
      t.string :post_code
      t.string :adress
      t.integer :status
      t.integer :postage
      t.integer :total_amount

      t.timestamps
    end
  end
end
