class Product < ApplicationRecord
  belongs_to :source
  belongs_to :category
  belongs_to :company
  has_many :order_in
  has_many :order_out 

  validates :source_id, :category_id, :product_name, :company_id, presence: true

end
