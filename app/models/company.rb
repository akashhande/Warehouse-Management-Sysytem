class Company < ApplicationRecord
	has_many :product
	has_many :source
	has_many :category
	has_many :user
	validates :company_name, presence: true
end
