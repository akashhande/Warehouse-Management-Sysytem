json.extract! product, :id, :source_id, :category_id, :product_name, :brand, :purchase_price, :sale_price, :created_at, :updated_at, :company_id, :product_quantity
json.url product_url(product, format: :json)
