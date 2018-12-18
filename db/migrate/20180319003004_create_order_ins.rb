class CreateOrderIns < ActiveRecord::Migration[5.1]
  def change
    create_table :order_ins do |t|
      t.references :product, foreign_key: true
      t.string :company
      t.references :source, foreign_key: true
      t.date :order_date
      t.date :expected_out_date
      t.integer :product_quantity
      t.decimal :purchase_price
      t.decimal :sale_price

      t.timestamps
    end
  end
end
