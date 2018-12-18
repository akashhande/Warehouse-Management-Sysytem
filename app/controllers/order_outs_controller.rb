class OrderOutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_out, only: [:show, :edit, :update, :destroy]

  # GET /order_outs
  # GET /order_outs.json
  def index
    @order_outs = OrderOut.all
  end

  # GET /order_outs/1
  # GET /order_outs/1.json
  def show
  end

  # GET /order_outs/new
  def new
    @order_out = OrderOut.new
  end

  # GET /order_outs/1/edit
  def edit
  end

  # POST /order_outs
  # POST /order_outs.json
  def create
    @order_out = OrderOut.new(order_out_params)

    respond_to do |format|
      if @order_out.save
        format.html { redirect_to @order_out, notice: 'Order out was successfully created.' }
        format.json { render :show, status: :created, location: @order_out }
      else
        format.html { render :new }
        format.json { render json: @order_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_outs/1
  # PATCH/PUT /order_outs/1.json
  def update
    respond_to do |format|
      if @order_out.update(order_out_params)
        format.html { redirect_to @order_out, notice: 'Order out was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_out }
      else
        format.html { render :edit }
        format.json { render json: @order_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_outs/1
  # DELETE /order_outs/1.json
  def destroy
    @order_out.destroy
    respond_to do |format|
      format.html { redirect_to order_outs_url, notice: 'Order out was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_out
      @order_out = OrderOut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_out_params
      params.require(:order_out).permit(:product_id, :company_id, :source_id, :product_quantity, :customer_name, :order_date, :orderer_name, :delivery_address, :delivery_address_city, :delivery_address_country, :delivery_address_zip)
    end
    
    def load_information
      puts "This is testing"
    end
end
