require 'productPrediction'
require 'wms_logger'
class DashboardController < ApplicationController
  before_action :authenticate_user!
  
    def index
        @logger = WMSLogger.instance
        getDataFromGem
        createBarChart
        product = params[:product_selected]
        unless  product.nil? || product == 0
            product = params[:dashboard][:product_id]
            prepareToCallGem(product)
        end
    end
    
    def prepareToCallGem(product)
        product_data = []
        product_insider = []
        @OrderOut = OrderOut.all
        @OrderOut.where("product_id = #{product}").each do |prod|
            product_insider.push(prod.delivery_address_city, prod.delivery_address_zip)
            product_data.push(product_insider)
            product_insider = []
        end
        setDataInDonut(ProductPrediction.getPrediction(product_data))
    end
    
    def getDataFromGem
        if current_user.company_id == 0
            @product_count = Product.where("company_id in (1, 2, 3)").count
            @source_count = Source.where("company_id in (1, 2, 3)").count
            @category_count = Category.where("company_id in (1, 2, 3)").count
            @logged_in_users = User.where("company_id in (1, 2, 3)").count
        else
            @order_in_count = OrderIn.where("company_id = #{current_user.company_id}").count
            @order_out_count = OrderOut.where("company_id = #{current_user.company_id}").count
            @expected_delivery_count = OrderIn.where("company_id = #{current_user.company_id} AND DATE(order_ins.expected_out_date) = ?", Date.tomorrow).count
            income_of_the_day = OrderIn.where("company_id = #{current_user.company_id} AND DATE(order_ins.created_at) = ?", Date.today).count
            outgoing_of_the_day = OrderOut.where("company_id = #{current_user.company_id} AND DATE(order_outs.created_at) = ?", Date.today).count
            @performanance_of_the_day = income_of_the_day + outgoing_of_the_day
        end 
    end
    
    def setDataInDonut(finalOutput)
        @zipOne = finalOutput[0].to_s+" "+finalOutput[1][0][0].to_s
        @zipTwo = finalOutput[0].to_s+" "+finalOutput[1][1][0].to_s
        @zipThree = finalOutput[0].to_s+" "+finalOutput[1][2][0].to_s
        
        gon.zipOne = @zipOne
        gon.zipTwo = @zipTwo
        gon.zipThree = @zipThree
        
        @zipOneValue = finalOutput[1][0][1].to_i
        @zipTwoValue = finalOutput[1][1][1].to_i
        @zipThreeValue = finalOutput[1][2][1].to_i

        gon.zipOneValue = @zipOneValue
        gon.zipTwoValue = @zipTwoValue
        gon.zipThreeValue = @zipThreeValue
    end
    
    def createBarChart
        @WH1_order_in_mar_count = OrderIn.where("company_id = 1 AND created_at BETWEEN ? AND ?", "2018-03-01", "2018-03-31").count
        @WH1_order_out_mar_count = OrderOut.where("company_id = 1 AND created_at BETWEEN ? AND ?", "2018-03-01", "2018-03-31").count
        @WH2_order_in_mar_count = OrderIn.where("company_id = 2 AND created_at BETWEEN ? AND ?", "2018-03-01", "2018-03-31").count
        @WH2_order_out_mar_count = OrderOut.where("company_id = 2 AND created_at BETWEEN ? AND ?", "2018-03-01", "2018-03-31").count
        @WH3_order_in_mar_count = OrderIn.where("company_id = 3 AND created_at BETWEEN ? AND ?", "2018-03-01", "2018-03-31").count
        @WH3_order_out_mar_count = OrderOut.where("company_id = 3 AND created_at BETWEEN ? AND ?", "2018-03-01", "2018-03-31").count
        
        gon.WH1_order_in_mar_count = @WH1_order_in_mar_count 
        gon.WH1_order_out_mar_count = @WH1_order_out_mar_count
        gon.WH2_order_in_mar_count = @WH2_order_in_mar_count 
        gon.WH2_order_out_mar_count = @WH2_order_out_mar_count
        gon.WH3_order_in_mar_count = @WH3_order_in_mar_count 
        gon.WH3_order_out_mar_count = @WH3_order_out_mar_count
    end
end