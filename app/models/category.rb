class Category < ApplicationRecord
	belongs_to :company
	has_many :product
    validates :category_name, :company_id, presence: true

end
