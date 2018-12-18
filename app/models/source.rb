class Source < ApplicationRecord
	belongs_to :company 
	has_many :product
	validates :source_name, :source_category, :address, :email, :company_id, presence: true
	validates :contact_number, format: { with: /\A[0-9]+\z/,message: "accepts digits only!"}

end
