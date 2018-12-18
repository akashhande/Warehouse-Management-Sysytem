# Observer for order out 
# When order are going outwards check quantity and reduce quantity after successful transaction.
require 'wms_logger'
class OrderOutObserver
    
    def order_out_qty(product)
        @logger = WMSLogger.instance
        @order_out_product_id = product.product_id.to_i
        Product.where("id = #{@order_out_product_id}").each do |prod|
            @Order_out_product_quantity_old = prod.product_quantity.to_i
       end
            @order_out_product_quantity_new = product.product_quantity.to_i
        if @Order_out_product_quantity_old >= @order_out_product_quantity_new 
            new_quantity = (@Order_out_product_quantity_old - @order_out_product_quantity_new).to_i
            updated_information = { "id" => product.product_id.to_i, 
            "product_quantity" => new_quantity }
        Product.where("id = #{@order_out_product_id}").update(updated_information)
        else
            puts "product_quantity not sufficient"
        end 
    end

    def update(updated_information)
        order_out_qty(updated_information)
        @logger.logInformation(Time.now.to_s+"  order_out_observer -> transaction sucessfull ")  
    end
end
