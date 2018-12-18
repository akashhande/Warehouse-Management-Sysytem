json.extract! order_out, :id, :product_id, :company_id, :source_id, :product_quantity, :customer_name, :order_date, :orderer_name, :delivery_address, :delivery_address_city, :delivery_address_country, :delivery_address_zip, :created_at, :updated_at
json.url order_out_url(order_out, format: :json)
