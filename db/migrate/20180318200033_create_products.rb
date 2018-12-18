class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :source, foreign_key: true
      t.references :category, foreign_key: true
      t.string :product_name
      t.string :brand
      t.string :purchase_price
      t.string :sale_price

      t.timestamps
    end
  end
end
