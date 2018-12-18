#this oberver pattern will update the quantity in the products table whenever a new incoming order is created 
# it will set the selling price to the latest value and update the purchase price by calculating the average 
#require 'wms_logger'

class ProductObserver
   
    def product_count_update(product)
        #@logger = WMSLogger.instance
        @product_id = product.product_id.to_i
        Product.where("id = #{@product_id}").each do |prod|
            @product_quantity_old = prod.product_quantity.to_i
            @product_purchase_price_old = prod.purchase_price.to_i
       end
        order_in_quantity = product.product_quantity
        new_quantity = (@product_quantity_old + product.product_quantity).to_i
        new_purchase_price = (((product.purchase_price.to_i * product.product_quantity.to_i) + (@product_purchase_price_old * @product_quantity_old))/new_quantity.to_i).to_i

        updated_information = { "id" => product.product_id.to_i, 
            "purchase_price"=> new_purchase_price, 
            "product_quantity" => new_quantity, 
            "sale_price" => product.sale_price.to_i
                }
        Product.where("id = #{@product_id}").update(updated_information)
    end

    def update(updated_information)
        #@logger.logInformation(Time.now.to_s+"  order_out_observer -> transaction sucessfull ") 
        product_count_update(updated_information)
    end
end