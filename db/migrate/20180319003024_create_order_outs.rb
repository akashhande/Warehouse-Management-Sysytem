class CreateOrderOuts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_outs do |t|
      t.references :product, foreign_key: true
      t.string :company
      t.references :source, foreign_key: true
      t.integer :product_quantity
      t.string :customer_name
      t.date :order_date
      t.string :orderer_name
      t.string :delivery_address
      t.string :delivery_address_city
      t.string :delivery_address_country
      t.string :delivery_address_zip

      t.timestamps
    end
  end
end
