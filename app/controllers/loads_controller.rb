class LoadsController < ApplicationController
  before_action :validate_admin_user, only: [:destroy]
  before_action :validate_company_user, only: [:edit, :update, :new, :new_multiple, :destroy] 
  before_action :set_load, only: [:show, :edit, :update, :destroy, :send_pdf]

 
  def index
    @all_loads = Load.all
  	@search_loads = @all_loads.search(params[:q])
  	@loads = @search_loads.result.order(:id).page(params[:page]).per(1000)

    # @destination = @load.load_origin_addresses.where(["pick_up_delivery = ?", "Delivery(Last Destination)"]).last
  	
    respond_to do |format|
      format.html
      format.csv { send_data @loads.as_csv }  
    end
  end


  def show  

    @destination = @load.load_origin_addresses.where(["address_category_id = ?", 4]).last  
    
    if @load.has_multiple_pd? && !@destination.present? 
      redirect_to new_load_load_origin_address_path(@load) and return
    end
    @percentage = @load.percentage 
    @company_profile = @load.company_profile    
    @transactions = @load.transactions  
    @vendor_profile = VendorProfile.all
    @load_doc = @load.load_documents 
    @driver = @load.driver_user 
    @driver_email = @driver.email
    @owner_operator_transactions = @load.transactions
    @cd_transactions = @load.transactions.where(["expense_type = ?", "Cash Advance"])
    @load_origin_addresses = @load.load_origin_addresses.order('created_at ASC')

    # @driver_locations = DriverLocation.where({ driver_email: @driver.email }).all.order('created_at desc')   
    # @driver_location = @driver_locations.first    
    @user = @driver 
  end




  def new 
    @load = current_company_user.loads.build 
    @load.load_origin_addresses.build
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @company_profile = CompanyProfile.all
  end



  def edit
    @load_driver = @load.driver_user
    @driver = DriverUser.where(["employment_status = ?", "active"])
    @company_user = current_company_user
    @company_profile = CompanyProfile.all   
    @load_origin_addresses = @load.load_origin_addresses.order('created_at ASC')
  end


  def create 
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @company_profile = CompanyProfile.all  
    @load = current_company_user.loads.build(load_params)

    respond_to do |format|
      if @load.save
        format.html { redirect_to @load, notice: 'Load was successfully created.' }
        format.json { render :show, status: :created, location: @load }
      else
        flash[:error] = @load.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @load.errors, status: :unprocessable_entity }
        # line_break = "<br>" 
        # SteveLog.debug("Load not created - validation errors #{line_break}")  
      end
    end
  end


  def update
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @company_profile = CompanyProfile.all  
    @load_origin_addresses = @load.load_origin_addresses.order('created_at ASC')
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to @load, notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @load }
      else
        flash[:error] = @load.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  
  def import
    Load.import(params[:file])
    redirect_to loads_path, notice: 'Loads have been uploaded.'
  end  


  def load_to_mobile
  end

  def send_pdf 
    @company_profile = @load.company_profile    

    @driver = @load.driver_user 
    @driver_email = @driver.email
    @load_origin_addresses = @load.load_origin_addresses.order('created_at ASC')

    @driver_locations = DriverLocation.where({ driver_email: @driver.email }).all.order('created_at desc')   
    @driver_location = @driver_locations.first    

    LoadMailer.active_load(@load).deliver_later 
    flash[:success] = "The PDF has been sent to #{@driver.email}"
    redirect_back(fallback_location: root_path)
  end

  
  private
    def validate_admin_user
      if !current_company_user.admin? 
        redirect_to root_path
          flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end
    

    def set_load
      @load = Load.find(params[:id])
    end
    
 
  



    def load_params
      params.require(:load).permit(
                                    :commodity, 
                                    :description,
                                    :has_multiple_pd,
                                    :weight, 
                                    :units, 
                                    :load_size, 
                                    :percent_deducted,      
                                    :miles,
                                    :pick_up_date,
                                    :pick_up_time,
                                    :delivery_date,
                                    :delivery_time,
                                    :equipment_type, 
                                    :status_name,
                                    :company_user_id,
                                    :driver_user_id,
                                    :updated_by,
                                    :pick_up_notes,
                                    :delivery_notes,
                                    :special_instructions,
                                    :dimentions,
                                    :destination_street,
                                    :destination_city,  
                                    :destination_state,
                                    :destination_zip,
                                    :origin_street,
                                    :origin_city,  
                                    :origin_state,
                                    :origin_zip,
                                    :origin_latitude,
                                    :origin_longitude,
                                    :destination_latitude,
                                    :destination_longitude,
                                    :origin_phone,
                                    :origin_contact,
                                    :destination_phone,
                                    :destination_contact,
                                    :shipper_company_name, 
                                    :receiver_company_name,
                                    :company_profile_id,
                                    :broker_shipper_load_id,
                                    :delivery_time_notes,
                                    :total_company_expenses,
                                    :booking_fee,
                                    :invoice_price,
                                    :driver_statement_id,
                                    :rate_to_owner_operator,
                                    :rate_to_driver_after_fees, 
                                    :agent_fee, 
                                    :percent_coverted_to_dollars,   
                                    :load_by_company_driver,
                                    :load_by_owner_not_paid_by_mile,   
                                    :load_by_owner_paid_by_mile,
                                    :driver_cents_pm,
                                    :percentage_id,
                                    :driver_rate_id, 
                                    :national_average_diesel_price,   
                                    :estimated_diesel_cost,
                                    :truck_mpg,
                                    :truck_year,
                                    :truck_number,
                                    :truck_make, 
                                    :truck_model,
                                    :truck_color,
                                    :truck_plate,
                                    :truck_state,
                                    :truck_vin,
                                    :trailer_number,
                                    :trailer_year,
                                    :trailer_make,
                                    :trailer_type,
                                    :trailer_length,
                                    :trailer_plate,
                                    :trailer_state,
                                    :trailer_vin,
                                    :trailer_door_type,
                                    :trailer_has_reefer,
                                    :broker_rep_name,
                                    :broker_rep_email,
                                    :broker_rep_number,
                                    :broker_rep_cell,
                                    :broker_after_hours_instructions,
                                    :pounds, 
                                    :kilos, 
                                    :is_pounds,
                                    :is_kilos,
                                    :is_hazmat,
                                    :is_temp_control,
                                    :is_fahrenheit,
                                    :is_celsius,
                                    :fahrenheit,
                                    :celsius,
                                    :kilometers,
                                    load_origin_addresses_attributes: 
                                      [
                                      :street,
                                      :city, 
                                      :state, 
                                      :zip,
                                      :type,
                                      :company_name, 
                                      :notes,
                                      :phone,
                                      :contact,
                                      :order
                                      ]
                                      )
    end
end

