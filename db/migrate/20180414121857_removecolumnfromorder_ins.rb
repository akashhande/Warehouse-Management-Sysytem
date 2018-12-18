class RemovecolumnfromorderIns < ActiveRecord::Migration[5.1]
  def change
  remove_column :order_ins, :companies_id, :integer
  add_reference :order_ins, :company, index: true
  end
end
