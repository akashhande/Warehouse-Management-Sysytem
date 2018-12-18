class RemovecolumnfromorderOuts < ActiveRecord::Migration[5.1]
  def change
  remove_column :order_ins, :company_id, :integer
  remove_column :order_outs, :company, :string
  remove_column :products, :companies_id, :integer
  add_reference :order_ins, :company, index: true
  add_reference :order_outs, :company, index: true
  add_reference :products, :company, index: true
  add_reference :sources, :company, index: true
  add_reference :categories, :company, index: true
  end
end
