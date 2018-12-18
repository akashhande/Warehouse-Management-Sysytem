json.extract! order_in, :id, :product_id, :company_id, :source_id, :order_date, :expected_out_date, :product_quantity, :purchase_price, :sale_price, :created_at, :updated_at
json.url order_in_url(order_in, format: :json)
