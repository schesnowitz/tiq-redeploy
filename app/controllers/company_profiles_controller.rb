class CompanyProfilesController < ApplicationController
  before_action :set_company_profile, only: [:show, :edit, :update, :destroy, :vendors]
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy] 

  def index
    @company_profiles = CompanyProfile.all
    respond_to do |format|
      format.html
      format.csv { send_data @company_profiles.as_csv } 
    end
  end


  def show
    @carrier_mc = @company_profile.carrier_mc
    @broker_mc = @company_profile.broker_mc
    @us_dot = @company_profile.us_dot

  end


  def new
    @company_profile = CompanyProfile.new
  end


  def edit
  end


  def create
    @company_profile = CompanyProfile.new(company_profile_params)

    respond_to do |format|
      if @company_profile.save
        format.html { redirect_to new_load_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company_profile }
      else
        format.html { render :new }
        format.json { render json: @company_profile.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @company_profile.update(company_profile_params)
        format.html { redirect_to @company_profile, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_profile }
      else
        format.html { render :edit }
        format.json { render json: @company_profile.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @company_profile.destroy
    respond_to do |format|
      format.html { redirect_to company_profiles_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    CompanyProfile.import(params[:file])
    redirect_to company_profiles_path, notice: 'Companies/Shippers/Brokers have been uploaded.'
  end 
  

  private

    def set_company_profile
      @company_profile = CompanyProfile.find(params[:id])
    end


    def company_profile_params
      params.require(:company_profile).permit(
                                              :company_name,
                                              :street,
                                              :city,
                                              :state,
                                              :zip,  
                                              :telephone,
                                              :fax,
                                              :website,
                                              :logo,
                                              :broker_mc_number,
                                              :carrier_mc_number,
                                              :us_dot_number,
                                              :updated_by,
                                              :contact,
                                              :email
                                              )
    end
end

