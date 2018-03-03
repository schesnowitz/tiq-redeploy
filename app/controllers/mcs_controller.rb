class McsController < ApplicationController
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy] 
 def show
    @company_profile = CompanyProfile.find(params[:company_profile_id])
    @dot = @company_profile.us_dot
    @carrier_mc = @company_profile.carrier_mc
    @broker_mc = @company_profile.broker_mc
  end
  
  def new 
    @company_profile = CompanyProfile.find(params[:company_id])
    @mc = @company_profile.mcs.build 
  end
  
  def create
    @company_profile = CompanyProfile.find(params[:company_id])
    @mc = @company_profile.mcs.build(oa_params)
    
    if @mc.save
      flash[:success] = "Your #{@mc.authority_type} with number #{@mc.number} has been saved"
      redirect_to @company_profile
    else
      flash[:danger] = "There was a problem saving your Authority"
      render :new
    end
  end
  
  def edit
    @company_profile = CompanyProfile.find(params[:company_id])
    @mc = Mc.find(params[:id]) 
    
    require 'capybara/poltergeist'
    session = Capybara::Session.new(:poltergeist)
    session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')
    session.choose('2')
    session.fill_in('4', with: @company_profile.broker_mc)
    session.find('input[type="SUBMIT"]').click
    
    
    name = session.current_url
    address = session.all('.queryfield')[0].text  
    telephone = session.all('.queryfield')[1].text 
      
    
    @company_profile = CompanyProfile.find(params[:company_id])
    @mc = Mc.find(params[:id]) 
    if @mc.update(name: name, address: address, telephone: telephone)
      flash[:success] = "Your #{@mc.type} with number #{@mc.number} has been updated"
      redirect_to @company_profile
    else
      flash[:danger] = "There was a problem saving your Authority"
      render :edit
    end
  end
end

