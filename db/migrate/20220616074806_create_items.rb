class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.integer :tax_off_price
      t.boolean :selling_status, default: false, null:false

      t.timestamps
    end
  end
end
