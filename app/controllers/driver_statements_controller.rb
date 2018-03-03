class DriverStatementsController < ApplicationController
  before_action :set_driver_statement, only: [:show, :edit, :update, :destroy]  
  #before_action :validate_hrc_user, only: [:edit, :update, :new, :destroy] 
  # GET /driver_statements
  # GET /driver_statements.json
  def index
    # @driver = DriverUser.find(params[:driver_user_id])
    @all_statements = DriverStatement.all
  	@search_statements = @all_statements.search(params[:q])
  	@driver_statements = @search_statements.result.order(:id).page(params[:page]).per(50)
    respond_to do |format|
      format.html
      format.csv { send_data @driver_statements.as_csv }  
    end
  end


  def show
    @driver = DriverUser.find(params[:driver_user_id]) 
    @loads = @driver_statement.loads.order(:id)


  end

  # GET /driver_statements/new
  def new
    @driver = DriverUser.find(params[:driver_user_id])
    @driver_statement = @driver.driver_statements.new
    @complete_loads = @driver.loads.where(["status_name = ?", "Complete"]).order(:id)   
    @loads = @complete_loads.where("driver_statement_id is NULL") 
  end

  def edit
    @driver = DriverUser.find(params[:driver_user_id])
    @loads = @driver_statement.loads
  end

  # POST /driver_statements
  # POST /driver_statements.json
  def create
    @driver = DriverUser.find(params[:driver_user_id])
    @driver_statement = @driver.driver_statements.new(driver_statement_params)
    @loads = @driver.loads.where(["status_name = ?", "Complete"]) 

    respond_to do |format|
      if @driver_statement.save
        format.html { redirect_to driver_user_driver_statement_path(@driver, @driver_statement), notice: 'Driver statement was successfully created.' }
        format.json { render :show, status: :created, location: @driver_statement }
      else
        flash[:error] = @driver_statement.errors.full_messages.to_sentence
        format.html { redirect_to request.referrer }  
        format.json { render json: @driver_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driver_statements/1
  # PATCH/PUT /driver_statements/1.json
  def update
    @driver = DriverUser.find(params[:driver_user_id])
    @loads = @driver.loads.where(["status_name = ?", "Complete"]) 
    respond_to do |format|
      if @driver_statement.update(driver_statement_params)
        format.html { redirect_to @driver, notice: 'Driver statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver_statement }
      else
        flash[:error] = @driver_statement.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @driver_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver_statements/1
  # DELETE /driver_statements/1.json
  def destroy
    @driver = DriverUser.find(params[:driver_user_id])
    @driver_statement.destroy
    respond_to do |format|
      format.html { redirect_to driver_user_driver_statements_url, notice: 'Driver statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    DriverStatement.import(params[:file])
    redirect_to driver_statements_path, notice: 'Statements have been uploaded.'
  end   

  def send_statement
    @driver_statement = DriverStatement.find(params[:id])
    @driver = DriverUser.find(params[:driver_user_id]) 
    @loads = @driver_statement.loads.order(:id)
    DriverStatementMailer.statement(@driver_statement).deliver_later 
    flash[:success] = "The PDF statement has been sent to #{@driver_statement.driver_user.email}" 
    redirect_back(fallback_location: root_path)
    # respond_to do |format|
    #   format.html 
    #   format.pdf do  
    #     render pdf: @driver_statement.payment_status, footer: { right: '[page] of [topage]' }
        # ,     
        # save_to_file: Rails.root.join('load_pdfs', "#{@load.id}#{@load.title}.pdf")

        # DriverStatementMailer.statement(@driver_statement).deliver_later
    #   end
    # end  

  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver_statement
      @driver_statement = DriverStatement.find(params[:id])
    end
    
    def validate_company_user
      if !validate_company_user  
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_statement_params
      params.require(:driver_statement).permit(
          :notes,
          :insurance_payment,
          :trailer_rental,
          :truck_rental,
          :other,
          :payment_status, 
          :due_date, 
          :driver_user_id, 
          :payment_notes,
          load_ids: [] 
          )
    end
end

