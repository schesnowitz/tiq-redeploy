class CompanyProfileMembershipsController < ApplicationController
  before_action :set_company_profile_membership, only: [:show, :edit, :update, :destroy]
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy] 

  # GET /company_profile_memberships
  # GET /company_profile_memberships.json
  def index
    @company_profile = CompanyProfile.find(params[:company_profile_id])
    @company_profile_memberships = @company_profile.company_profile_membership
 
  end

  # GET /company_profile_memberships/1
  # GET /company_profile_memberships/1.json
  def show
    # @user = User.find(params[:user_id])
    @company_profile = CompanyProfile.find(params[:company_profile_id]) 
  end

  # GET /company_profile_memberships/new
  def new
    @users = User.all
    @company_profile = CompanyProfile.find(params[:company_profile_id]) 
    @company_profile_membership = @company_profile.company_profile_membership.new
  end

  # GET /company_profile_memberships/1/edit
  def edit
    @company_profile = CompanyProfile.find(params[:company_profile_id]) 
    @users = User.all
  end

  # POST /company_profile_memberships
  # POST /company_profile_memberships.json
  def create
    @users = User.all
    @company_profile = CompanyProfile.find(params[:company_profile_id]) 
    @company_profile_membership = CompanyProfileMembership.new(company_profile_membership_params)

    respond_to do |format|
      if @company_profile_membership.save
        format.html { redirect_to @company_profile, 
        notice: 'Company profile membership was successfully created.' }
        format.json { render :show, status: :created, location: @company_profile_membership }
      else
        flash[:error] = @company_profile_membership.errors.full_messages.to_sentence  
        format.html { render :new }
        format.json { render json: @company_profile_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_profile_memberships/1
  # PATCH/PUT /company_profile_memberships/1.json
  def update
    #@users = User.find(params[:user_id])
    @company_profile = CompanyProfile.find(params[:company_profile_id]) 
    respond_to do |format|
      if @company_profile_membership.update(company_profile_membership_params)
        format.html { redirect_to @company_profile, 
        notice: 'Company profile membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_profile_membership }
        flash[:error] = @company_profile_membership.errors.full_messages.to_sentence        
      else
        format.html { render :edit }
        format.json { render json: @company_profile_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_profile_memberships/1
  # DELETE /company_profile_memberships/1.json
  def destroy
    @company_profile = CompanyProfile.find(params[:company_profile_id]) 
    @company_profile_membership.destroy
    respond_to do |format|
      format.html { redirect_to @company_profile, notice: 'Company profile membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_profile_membership
      @company_profile_membership = CompanyProfileMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_profile_membership_params
      params.require(:company_profile_membership).permit(
        :company_profile_id, 
        :user_id, 
        :membership_type
        )
    end
end
