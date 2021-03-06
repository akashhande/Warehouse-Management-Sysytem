require 'prawn'
require 'wms_logger'
class GenerateDailyReport < Prawn::Document
    
    def initialize
       @logger = WMSLogger.instance
       super(top_margin: 70)
       $shipment_dynamic_data = []
       $shipment_dynamic_data.push(["Product Name", "Order Date", "Expected Out Date", "Quantity", "Sale Price", "Purchase Price"])
       createBasicPdf
    end
    
    # Basic PDF created here with report name
    def createBasicPdf
        # Create Header part of report
        repeat :all do
          bounding_box [bounds.left, bounds.top + 19], width: bounds.width do
            text "Daily Incoming Report ", size: 18, align: :center
          end
        end
        
        # Main body of report
        bounding_box [bounds.left, bounds.top], width: bounds.width, height: bounds.height - 17 do
          generateDailyReport
          line_items
        end
        
        # Create Footer part of report
        repeat :all do
          bounding_box [bounds.left, bounds.bottom + 29], width: bounds.width do
            text "Generated by - "+$logged_in_user, size: 12, align: :right
            text "Generated at - "+Time.now.strftime("%d/%m/%Y %H:%M"), size: 12, align: :left
          end
        end
        @logger.logInformation(Time.now.to_s+"     generate_daily_report -> createBasicPdf - Creating basic PDF")
    end
    
    # Generate table with coloured rows
    def line_items
      move_down 20
      table generateTableData do
        row(0).font_style = :bold
        columns(1..3).align = :right
        self.row_colors = ['DDDDDD', 'FFFFFF']
        self.header = true
        self.rows(1..3).width = 90
      end
      @logger.logInformation(Time.now.to_s+"     generate_daily_report -> line_items - Creating table PDF")
    end
      
    # Inventory on Hand Report
    def generateDailyReport
        @order_ins = OrderIn.all
        puts "test - "+$customer.to_s
        @order_ins.where("company_id #{$companies_id} AND DATE(order_ins.created_at) = ?", Date.today).each do |product|
             $shipment_dynamic_data.push([product.product_id.to_s, product.order_date.to_s, product.expected_out_date.to_s, product.product_quantity.to_s, product.sale_price.to_s, product.purchase_price.to_s])
        end
        @logger.logInformation(Time.now.to_s+"     generate_daily_report -> generateDailyReport - Creating dynamic table for PDF report")
    end
  
    def generateTableData
        $shipment_dynamic_data
    end
end