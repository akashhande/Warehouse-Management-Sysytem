#require 'pry'
require "prawn"
require 'wms_logger'
class ReportsController < ApplicationController
  before_action :authenticate_user!
  
  def Report
     @logger = WMSLogger.instance
     reportType = params[:reportType]
     $companies_id = params[:company_id]
     $current_user_admin = params[:current_user_admin]
     $logged_in_user = params[:logged_in_user]
      unless  reportType.nil? || reportType == 0
          send_data GenerateReports(reportType),
                filename: "#{reportType}.pdf",
                type: "application/pdf"
      end
  end 
  
  # Generate PDF report  
  private 
  def GenerateReports(reportType)
      if reportType == "Inventory on Hand"
         @logger.logInformation(Time.now.to_s+"     reports_controller -> GenerateReports -> Generating Inventory on Hand")
         GenerateInventoryReport.new do
         end.render
      elsif reportType == "Daily Incoming Report"
         @logger.logInformation(Time.now.to_s+"     reports_controller -> GenerateReports -> Generating Daily Incoming Report")
         GenerateDailyReport.new do
         end.render
      elsif reportType == "Products shortage"
         @logger.logInformation(Time.now.to_s+"     reports_controller -> GenerateReports -> Generating Products shortage Report")
         GenerateShortageReport.new do
         end.render
      else
         @logger.logInformation(Time.now.to_s+"     reports_controller -> GenerateReports -> Wrong choice of report")
      end
  end
end


