class OrderInsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_in, only: [:show, :edit, :update, :destroy]

  # GET /order_ins
  # GET /order_ins.json
  def index
    @order_ins = OrderIn.all 
    #load_information()
  end

  # GET /order_ins/1
  # GET /order_ins/1.json
  def show
  end

  # GET /order_ins/new
  def new
    @order_in = OrderIn.new
  end

  # GET /order_ins/1/edit
  def edit
  end

  # POST /order_ins
  # POST /order_ins.json
  def create
    @order_in = OrderIn.new(order_in_params)

    respond_to do |format|
      if @order_in.save
        format.html { redirect_to @order_in, notice: 'Order in was successfully created.' }
        format.json { render :show, status: :created, location: @order_in }
      else
        format.html { render :new }
        format.json { render json: @order_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_ins/1
  # PATCH/PUT /order_ins/1.json
  def update
    respond_to do |format|
      if @order_in.update(order_in_params)
        format.html { redirect_to @order_in, notice: 'Order in was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_in }
      else
        format.html { render :edit }
        format.json { render json: @order_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_ins/1
  # DELETE /order_ins/1.json
  def destroy
    @order_in.destroy
    respond_to do |format|
      format.html { redirect_to order_ins_url, notice: 'Order in was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_in
      @order_in = OrderIn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_in_params
      params.require(:order_in).permit(:product_id, :company_id, :source_id, :order_date, :expected_out_date, :product_quantity, :purchase_price, :sale_price)
    end
    
    def load_information
       logger.info "Processing the request...1"
       logger.debug "here it is : #{params[1].inspect}"
    
      logger.info "Processing the request..."
      @order_in = OrderIn.pluck(:id)
      
      @msg = { "success" => "true", "message" => @order_in }
        respond_to do |format|
          format.html
          format.json { render json: @msg }
        end
    end
end
