class Addcolumntoproducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :available_quantity, :integer
  	add_column :products, :product_quantity, :integer 
  end
end
