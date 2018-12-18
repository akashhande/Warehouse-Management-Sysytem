class RemoveCompanyFromOrderIns < ActiveRecord::Migration[5.1]
  def change
  	remove_column :order_ins, :company, :string
  	add_reference :order_ins, :companies, index: true
  	add_column :products, :available_quantity, :integer
  	add_reference :products, :companies, index: true
  end
end
