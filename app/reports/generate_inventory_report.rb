require 'prawn'
require 'wms_logger'
class GenerateInventoryReport < Prawn::Document
    
    def initialize
       @logger = WMSLogger.instance
       super(top_margin: 70)
        $inventory_dynamic_data = []
        $inventory_dynamic_data.push(["Product Name", "Quantity", "Brand", "Purchase Price", "Sale Price"])
       createBasicPdf
    end
    
    # Basic PDF created here with report name
    def createBasicPdf
        # Create Header part of report
        repeat :all do
          bounding_box [bounds.left, bounds.top + 19], width: bounds.width do
            text "Inventory on Hand Report", size: 18, align: :center
          end
        end
        
        # Main body of report
        bounding_box [bounds.left, bounds.top], width: bounds.width, height: bounds.height - 17 do
          generateInventoryOnHand
          line_items
        end
        
        # Create Footer part of report
        repeat :all do
          bounding_box [bounds.left, bounds.bottom + 29], width: bounds.width do
            text "Generated by - "+$logged_in_user, size: 12, align: :right
            text "Generated at - "+Time.now.strftime("%d/%m/%Y %H:%M"), size: 12, align: :left
          end
        end
        @logger.logInformation(Time.now.to_s+"     GenerateInventoryReport -> createBasicPdf - Creating basic PDF")
    end
    
    # Generate table with coloured rows
    def line_items
      move_down 20
      table generateTableData do
        row(0).font_style = :bold
        columns(1..3).align = :right
        self.row_colors = ['DDDDDD', 'FFFFFF']
        self.header = true
        self.rows(1..3).width = 100
      end
      @logger.logInformation(Time.now.to_s+"     GenerateInventoryReport -> line_items - Creating table for PDF")
    end
      
    # Inventory on Hand Report
    def generateInventoryOnHand
        @products = Product.all
        @products.where("company_id #{$companies_id}").each do |product|
           $inventory_dynamic_data.push([product.product_name.to_s, product.product_quantity.to_s, product.brand, product.purchase_price.to_s, product.sale_price.to_s])
        end
        @logger.logInformation(Time.now.to_s+"     GenerateInventoryReport -> generateInventoryOnHand - Creating dynamic table for PDF report")
    end
    
    def generateTableData
        $inventory_dynamic_data
    end
end