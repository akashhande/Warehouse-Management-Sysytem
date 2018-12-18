json.extract! source, :id, :source_name, :source_category, :address, :email, :contact_number, :created_at, :updated_at, :company_name
json.url source_url(source, format: :json)
