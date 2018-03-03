class UsersController < ApplicationController
  before_action :validate_company_user, only: [:edit, :update, :destroy, :index]
  

  def index
  	@search = Load.search(params[:q])
  	@loads = @search.result.order(:id).page(params[:page]).per(1000) 
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data @users.as_csv } 
    end
  end
  
  # def show 
  #   @user = User.find(params[:id]) 
  # end
  
  def edit
    @user = User.find(params[:id])
  end 

    private
    def validate_company_user
      if !current_company_user
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end
end  



