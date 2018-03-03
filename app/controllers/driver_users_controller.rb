class DriverUsersController < UsersController 
  include ApplicationHelper
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy]
  
  def index
  	@search = DriverUser.search(params[:q])
  	@drivers = @search.result.order(:id).page(params[:page]).per(1000) 

    respond_to do |format|
      format.html
      format.csv { send_data @drivers.as_csv } 
    end
  end
  

  def update
    @user = User.find(params[:id])
    if params[:driver_user][:password].blank?
      params[:driver_user].delete(:password)
      params[:driver_user].delete(:password_confirmation) 
    end
    
    if @user.update(user_params)

      flash[:success] = "The user was updated"
      redirect_to @user
 
    else
        flash[:error] = @user.errors.full_messages.to_sentence
      render :edit  
    end
  end 
  
  def show 
    @driver = DriverUser.find(params[:id]) 
    @driver_email = @driver.email 
    @driver_rate_per_mile = @driver.driver_rate
    @company_user = current_company_user
  	@driver_statements = @driver.driver_statements if !nil? 
    @active_load = @driver.loads.where(["status_name = ?", "Active"])
    @last_active_load = @driver.loads.where(["status_name = ?", "Active"]).last
  	@search_active = @active_load.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
    @loads_no_statement = @driver.loads.where("driver_statement_id is NULL")
    @complete = @loads_no_statement.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
    # @message = Message.last 
    # @messages = Message.all.order('created_at desc') 
    # @inbound = @messages.find_by(inbound: 'true')
    # @driver_locations = DriverLocation.where({ driver_email: @driver_email }).all.order('created_at desc')  
    # @driver_location = @driver_locations.first

    # @location_paginate = @driver_locations.order(:parse_created_at).page(params[:page]).per(15)  
  	@truck = @driver.truck 
  	@trailer = @driver.trailer      
  end

    
  def driver_dashboard
    @driver = current_driver_user
  	@driver_statements = @driver.driver_statements if !nil? 
    @active = @driver.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
  	
    @loads_no_statement = @driver.loads.where("driver_statement_id is NULL")
    @complete = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	
    @cancelled = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_cancelled = @cancelled.search(params[:q])
  	@completed_loads = @search_cancelled.result.order(:id).page(params[:page]).per(1000) 
  	
  	@truck = @driver.truck 
  	@trailer = @driver.trailer  

    @ip = request.remote_ip 
    @location = Geocoder.coordinates(@ip)
  end
 
  def import
    @import = DriverUser.import(params[:file])
    flash[:success] = 'Drivers have been imported!'
    redirect_to driver_users_path
  end




  
  private
  

    
    def validate_driver_user
      if !current_driver_user
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end

  def user_params
    params.require(:driver_user).permit(:password, 
                                        :password_confirmation,
                                        :current_password,
                                        :email,
                                        :first_name,
                                        :last_name,
                                        :telephone,
                                        :extention,
                                        :cellphone,
                                        :street, 
                                        :city, 
                                        :state, 
                                        :zip,  
                                        :type,
                                        :image, 
                                        :profile_image,
                                        :emergency_contact,
                                        :emergency_contact_number,
                                        :employment_status,
                                        :company_driver, 
                                        :driver_rpm,
                                        :time_zone,
                                        :company_driver,
                                        :owner_operator,
                                        :owner_operator_pbm,
                                        :driver_rate_id,
                                        :amount
                                        )
                              
  end
end