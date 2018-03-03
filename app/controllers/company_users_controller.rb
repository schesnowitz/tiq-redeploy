class CompanyUsersController < UsersController 
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy]
  def index
  	@search = CompanyUser.search(params[:q])
  	@company_users = @search.result.order(:id).page(params[:page]).per(1000) 
    respond_to do |format|
      format.html
      format.csv { send_data @company_users.as_csv } 
    end
  end
  
  def update
    @user = User.find(params[:id])
    if params[:company_user][:password].blank? 
      params[:company_user].delete(:password)
      params[:company_user].delete(:password_confirmation) 
    end
    
    if @user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to root_path 
    else
      flash[:error] = "There was a problem" 
      render :edit  
    end
  end 
  
  def show 
    @company_user = CompanyUser.find(params[:id]) 
    
    @active = @company_user.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
  	
    @complete = @company_user.loads.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	
    @paid = @company_user.loads.where(["status_name = ?", "Paid"])
  	@search_paid = @paid.search(params[:q])
  	@paid_loads = @search_paid.result.order(:id).page(params[:page]).per(1000) 
  	
    @cancelled = @company_user.loads.where(["status_name = ?", "Complete"])
  	@search_cancelled = @cancelled.search(params[:q])
  	@completed_loads = @search_cancelled.result.order(:id).page(params[:page]).per(1000) 
  	
  end
  
  def company_dashboard 
    @company_user = current_company_user
    @active = @company_user.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
  	
    @complete = @company_user.loads.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	
    @paid = @company_user.loads.where(["status_name = ?", "Paid"])
  	@search_paid = @paid.search(params[:q])
  	@paid_loads = @search_paid.result.order(:id).page(params[:page]).per(1000) 
  	
    @cancelled = @company_user.loads.where(["status_name = ?", "Cancelled"]) 
  	@search_cancelled = @cancelled.search(params[:q])
  	@completed_loads = @search_cancelled.result.order(:id).page(params[:page]).per(1000)
  	
    @pending = @company_user.loads.where(["status_name = ?", "Pending"])
  	@search_pending = @pending.search(params[:q])
  	@pending_loads = @search_pending.result.order(:id).page(params[:page]).per(1000)  
  	


  end
  
  def import
    CompanyUser.import(params[:file])
    redirect_to company_users_path, notice: 'HRC Users have been uploaded.'
  end   
  
private

  def user_params
    params.require(:company_user).permit(:password, 
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
                                     :profile_b, 
                                     :profile_image,
                                     :emergency_contact,
                                     :emergency_contact_number,
                                     :company_profile_admin,
                                     :admin,
                                     :dispatcher,
                                     :office,
                                     :maintenance,
                                     :shipping_receiving,
                                     :driver,
                                     :employment_status 
                                     )
                              
  end
end
