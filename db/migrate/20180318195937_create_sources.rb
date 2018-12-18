class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :source_name
      t.string :source_category
      t.string :address
      t.string :email
      t.integer :contact_number

      t.timestamps
    end
  end
end
