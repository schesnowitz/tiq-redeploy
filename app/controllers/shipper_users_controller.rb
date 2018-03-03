class ShipperUsersController < UsersController 
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy]
  def index
  	@search = ShipperUser.search(params[:q])
  	@shipper_users = @search.result.order(:id).page(params[:page]).per(1000) 
    respond_to do |format|
      format.html
      format.csv { send_data @shipper_users.as_csv }  
    end
  end
  
  def update
    @user = User.find(params[:id])
    if params[:shipper_user][:password].blank?
      params[:shipper_user].delete(:password)
      params[:shipper_user].delete(:password_confirmation) 
    end
    
    if @user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to root_path  
    else
      flash[:error] = "There was a problem" 
      render :edit  
    end
  end 
  
  def shipper_dashboard
    @shipper = current_shipper_user
  end
  
  def show 
    @shipper = ShipperUser.find(params[:id])  
  end
 
  def import
    ShipperUser.import(params[:file])
    redirect_to shipper_users_path, notice: 'Shippers have been uploaded.'
  end 
  
  private

  def user_params
    params.require(:shipper_user).permit(:password, 
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
                                         :company_profile_admin,
                                         :dispatcher,
                                         :office,
                                         :maintenance,
                                         :shipping_receiving,
                                         :driver,
                                         :employment_status 
                                         )
                              
  end
end

