class UsDotsController < McsController
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy] 
  def show
    @company_profile = CompanyProfile.find(params[:company_profile_id]) 
    @us_dot = @company_profile.us_dot
  end 

  def new 
    @company_profile = CompanyProfile.find(params[:company_profile_id])
    @us_dot = @company_profile.us_dots.build 
  end
  
  def create
    @company_profile = CompanyProfile.find(params[:company_profile_id])
    @us_dot = @company_profile.us_dots.build(dot_params) 
    @us_dot.save
    #   flash[:success] = "Your #{@us_dot.authority_type} with number #{@us_dot.number} has been saved"
    #   redirect_to @company_profile
    # else
    #   flash[:danger] = "There was a problem saving your Authority"
    #   render :new
    # end
  end
  
  def edit
    @company_profile = CompanyProfile.find(params[:company_profile_id]) 
    @us_dot = @company_profile.us_dot
    
    require 'capybara/poltergeist'
    session = Capybara::Session.new(:poltergeist)
    session.driver.options[:phantomjs] = Phantomjs.path 
    session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')
    session.choose('1')
    session.fill_in('4', with: @company_profile.us_dot_number) 
    session.find('input[type="SUBMIT"]').click
    
    
      entity_type = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(2) > td').text
      operating_status = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(3) > td:nth-child(2)').text
      out_of_service_date = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(3) > td:nth-child(4)').text
      legal_name = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(4) > td').text
      dba_name = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(5) > td').text
      physical_address = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(6) > td').text
      phone = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(7) > td').text
      mailing_address = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(8) > td').text
      usdot_number = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(9) > td:nth-child(2)').text
      state_carrier_id_number = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(9) > td:nth-child(4)').text
      mc_mx_ff_numbers = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(9) > td:nth-child(2)').text
      duns_number = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(10) > td:nth-child(4)').text
      power_units  = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(11) > td.queryfield').text
      driver_count = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(11) > td:nth-child(4) > font > b').text
      mcs_150_form_date = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(12) > td.queryfield').text
      mcs_150_mileage_year = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(12) > td:nth-child(4)').text 

      general_freight = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(2) > td.queryfield').text 
      household_goods = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(3) > td.queryfield').text 
      metal_sheets_coils_rolls = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(4) > td.queryfield').text 
      motor_vehicles = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(5) > td.queryfield').text 
      drivetow_away = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(6) > td.queryfield').text 
      logs_poles_beams_lumber = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(7) > td.queryfield').text 
      building_materials = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(8) > td.queryfield').text 
      mobile_homes = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(9) > td.queryfield').text 
      machinery_large_objects = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(10) > td.queryfield').text 
      fresh_produce = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > table > tbody > tr:nth-child(11) > td.queryfield').text 
      liquids_gases = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(2) > td.queryfield').text 
      intermodal = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(3) > td.queryfield').text  
      passengers = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(4) > td.queryfield').text 
      oilfield_equipment = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(5) > td.queryfield').text 
      livestock = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(6) > td.queryfield').text 
      grain_feed_hay = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(7) > td.queryfield').text 
      coal_coke = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(8) > td.queryfield').text 
      meat = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(9) > td.queryfield').text 
      garbage_refuse = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(10) > td.queryfield').text 
      us_mail = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > table > tbody > tr:nth-child(11) > td.queryfield').text 
      chemicals = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(3) > table > tbody > tr:nth-child(2) > td.queryfield').text 
      commodities_dry_bulk = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(3) > table > tbody > tr:nth-child(3) > td.queryfield').text 
      refrigerated_food = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(3) > table > tbody > tr:nth-child(4) > td.queryfield').text 
      beverages = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(3) > table > tbody > tr:nth-child(5) > td.queryfield').text 
      paper_products = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(3) > table > tbody > tr:nth-child(6) > td.queryfield').text 
      utilities = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(3) > table > tbody > tr:nth-child(7) > td.queryfield').text 
      agricultural_farm_supplies = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(3) > table > tbody > tr:nth-child(8) > td.queryfield').text 
      construction = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(3) > table > tbody > tr:nth-child(9) > td.queryfield').text 
      water_well = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(19) > td > table > tbody > tr:nth-child(2) > td:nth-child(3) > table > tbody > tr:nth-child(10) > td.queryfield').text 
      
      driver_inspections_count = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(2) > td:nth-child(3)').text 
      vehicle_inspections_count = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(2) > td:nth-child(2)').text 
      hazmat_inspections_count = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(2) > td:nth-child(4)').text 
      iep_inspections_count = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(2) > td:nth-child(5)').text 
      driver_inspections_out_service = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(3) > td:nth-child(3)').text 
      vehicle_inspections_out_service = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(3) > td:nth-child(2)').text 
      hazmat_inspections_out_service = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(3) > td:nth-child(4)').text 
      iep_inspections_out_service = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(3) > td:nth-child(5)').text 
      driver_inspections_out_service_percent = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(4) > td:nth-child(3)').text 
      vehicle_inspections_out_service_percent = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(4) > td:nth-child(2)').text 
      hazmat_inspections_out_service_percent = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(4) > td:nth-child(4)').text 
      iep_inspections_out_service_percent = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(13) > table > tbody > tr:nth-child(4) > td:nth-child(5)').text 
      crash_results_24_prior = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > font:nth-child(16) > b:nth-child(1) > font').text 
      crash_fatal = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(19) > table > tbody > tr:nth-child(2) > td:nth-child(2)').text 
      crash_injury = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(19) > table > tbody > tr:nth-child(2) > td:nth-child(3)').text 
      crash_tow = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(19) > table > tbody > tr:nth-child(2) > td:nth-child(4)').text 
      crash_total = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(19) > table > tbody > tr:nth-child(2) > td:nth-child(5)').text 
      cad_vehicle_inspections = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(29) > table > tbody > tr:nth-child(2) > td:nth-child(2)').text 
      cad_driver_inspections = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(29) > table > tbody > tr:nth-child(2) > td:nth-child(3)').text 
      cad_vehicle_out_of_service = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(29) > table > tbody > tr:nth-child(3) > td:nth-child(2)').text 
      cad_driver_out_of_service = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(29) > table > tbody > tr:nth-child(3) > td:nth-child(3)').text 
      cad_vehicle_out_of_service_percent = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(29) > table > tbody > tr:nth-child(4) > td:nth-child(2)').text 
      cad_driver_out_of_service_percent = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(29) > table > tbody > tr:nth-child(4) > td:nth-child(3)').text 
      us_inspections_prev_24 = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > font:nth-child(10) > b:nth-child(1) > font').text 
      cad_inspections_prev_24 = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > font:nth-child(26) > b:nth-child(1) > font').text  
      
      cad_crash_results_24_prior = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > font:nth-child(32) > b:nth-child(1) > font').text 
      cad_crash_fatal = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(35) > table > tbody > tr:nth-child(2) > td:nth-child(2)').text 
      cad_crash_injury = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(35) > table > tbody > tr:nth-child(2) > td:nth-child(3)').text
      cad_crash_tow = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(35) > table > tbody > tr:nth-child(2) > td:nth-child(4)').text
      cad_crash_total = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(35) > table > tbody > tr:nth-child(2) > td:nth-child(5)').text
      
      us_inspection_results_for_24_months_prior_to = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > font:nth-child(10) > b:nth-child(1) > font').text 
      total_inspections = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > font:nth-child(10) > font:nth-child(4)').text
      total_iep_inspections = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > font:nth-child(10) > font:nth-child(6)').text
      crash_inspections = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > font:nth-child(26) > font').text 
             
      the_rating_below_is_current_as_of = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > font:nth-child(45) > b:nth-child(4) > font').text
      rating_date = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(47) > table > tbody > tr:nth-child(2) > td:nth-child(2)').text
      review_date = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(47) > table > tbody > tr:nth-child(2) > td:nth-child(4)').text
      review_rating = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(47) > table > tbody > tr:nth-child(3) > td:nth-child(2)').text
      review_type = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(47) > table > tbody > tr:nth-child(3) > td:nth-child(4)').text  
            


    @company_profile = CompanyProfile.find(params[:company_profile_id])
    @us_dot = @company_profile.us_dot
    if @us_dot.update!(
                          entity_type: entity_type, 
                          operating_status: operating_status,
                          out_of_service_date: out_of_service_date,
                          legal_name: legal_name,
                          dba_name: dba_name,
                          physical_address: physical_address,
                          phone: phone,
                          mailing_address: mailing_address,
                          usdot_number: usdot_number,
                          state_carrier_id_number: state_carrier_id_number,	 
                          mc_mx_ff_numbers: mc_mx_ff_numbers,
                          duns_number: duns_number,
                          power_units: power_units, 	
                          driver_count: driver_count,	
                          mcs_150_form_date: mcs_150_form_date,
                          mcs_150_mileage_year: mcs_150_mileage_year,
                          general_freight: general_freight,
                          household_goods: household_goods,
                          metal_sheets_coils_rolls: metal_sheets_coils_rolls,
                          motor_vehicles: motor_vehicles,
                          drivetow_away: drivetow_away,
                          logs_poles_beams_lumber: logs_poles_beams_lumber,
                          building_materials: building_materials,
                          mobile_homes: mobile_homes,
                          machinery_large_objects: machinery_large_objects,
                          fresh_produce: fresh_produce,
                          liquids_gases: liquids_gases,
                          intermodal: intermodal, 
                          passengers: passengers,
                          oilfield_equipment: oilfield_equipment,
                          livestock: livestock,
                          grain_feed_hay: grain_feed_hay,
                          coal_coke: coal_coke,
                          meat: meat,
                          garbage_refuse: garbage_refuse,
                          us_mail: us_mail,
                          chemicals: chemicals,
                          commodities_dry_bulk: commodities_dry_bulk,
                          refrigerated_food: refrigerated_food,
                          beverages: beverages,
                          paper_products: paper_products,
                          utilities: utilities,
                          agricultural_farm_supplies: agricultural_farm_supplies,
                          construction: construction,
                          water_well: water_well,
                          driver_inspections_count: driver_inspections_count,
                          vehicle_inspections_count: vehicle_inspections_count,
                          hazmat_inspections_count: hazmat_inspections_count,
                          iep_inspections_count: iep_inspections_count,
                          driver_inspections_out_service: driver_inspections_out_service,
                          vehicle_inspections_out_service: vehicle_inspections_out_service,
                          hazmat_inspections_out_service: hazmat_inspections_out_service,
                          iep_inspections_out_service: iep_inspections_out_service,
                          driver_inspections_out_service_percent: driver_inspections_out_service_percent,
                          vehicle_inspections_out_service_percent: vehicle_inspections_out_service_percent,
                          hazmat_inspections_out_service_percent: hazmat_inspections_out_service_percent,
                          iep_inspections_out_service_percent: iep_inspections_out_service_percent,
                          crash_fatal: crash_fatal,
                          crash_injury: crash_injury,
                          crash_tow: crash_tow,
                          crash_total: crash_total,
                          cad_vehicle_inspections: cad_vehicle_inspections,
                          cad_driver_inspections: cad_driver_inspections,
                          cad_vehicle_out_of_service: cad_vehicle_out_of_service,
                          cad_driver_out_of_service: cad_driver_out_of_service,
                          cad_vehicle_out_of_service_percent: cad_vehicle_out_of_service_percent,
                          cad_driver_out_of_service_percent: cad_driver_out_of_service_percent,
                          us_inspections_prev_24: us_inspections_prev_24,
                          cad_inspections_prev_24: cad_inspections_prev_24,
                          crash_results_24_prior: crash_results_24_prior, 
                          cad_crash_results_24_prior: cad_crash_results_24_prior, 
                          cad_crash_fatal: cad_crash_fatal, 
                          cad_crash_injury: cad_crash_injury, 
                          cad_crash_tow: cad_crash_tow,  
                          cad_crash_total: cad_crash_total, 
                          us_inspection_results_for_24_months_prior_to: us_inspection_results_for_24_months_prior_to,
                          total_inspections: total_inspections,
                          total_iep_inspections: total_iep_inspections,
                          crash_inspections: crash_inspections,
                          the_rating_below_is_current_as_of: the_rating_below_is_current_as_of,
                          rating_date: rating_date, 
                          review_date: review_date, 
                          review_rating: review_rating,
                          review_type: review_type                          
                         )

      flash[:success] = "Your #{@us_dot.entity_type} number #{@us_dot.mc_mx_ff_numbers} with an Operating Status of #{@us_dot.operating_status} has been updated."
      redirect_to @company_profile
    else
      flash[:danger] = "There was a problem saving your Authority"
      redirect_to @company_profile
    end
  end
  

  private
  
  def dot_params
    params.require(:us_dot).permit(
                                        :type,
                                        :entity_type,
                                        :operating_status,
                                        :out_of_service_date,
                                        :legal_name,
                                        :dba_name,
                                        :physical_address,
                                        :phone,
                                        :mailing_address,
                                        :usdot_number,
                                        :state_carrier_id_number,	 
                                        :mc_mx_ff_numbers,
                                        :duns_number,
                                        :power_units, 	
                                        :driver_count,	
                                        :mcs_150_form_date,
                                        :mcs_150_mileage_year,
                                        :general_freight,
                                        :household_goods,
                                        :metal_sheets_coils_rolls,
                                        :motor_vehicles,
                                        :drivetow_away,
                                        :logs_poles_beams_lumber,
                                        :building_materials,
                                        :mobile_homes,
                                        :machinery_large_objects,
                                        :fresh_produce,
                                        :safer_layout,
                                        :liquids_gases,
                                        :intermodal, 
                                        :passengers,
                                        :oilfield_equipment,
                                        :livestock,
                                        :grain_feed_hay,
                                        :coal_coke,
                                        :meat,
                                        :garbage_refuse,
                                        :us_mail,
                                        :chemicals,
                                        :commodities_dry_bulk,
                                        :refrigerated_food,
                                        :beverages,
                                        :paper_products,
                                        :utilities,
                                        :agricultural_farm_supplies,
                                        :construction,
                                        :water_well,
                                        :driver_inspections_count,
                                        :vehicle_inspections_count,
                                        :hazmat_inspections_count,
                                        :iep_inspections_count,
                                        :driver_inspections_out_service,
                                        :vehicle_inspections_out_service,
                                        :hazmat_inspections_out_service,
                                        :iep_inspections_out_service,
                                        :driver_inspections_out_service_percent,
                                        :vehicle_inspections_out_service_percent,
                                        :hazmat_inspections_out_service_percent,
                                        :iep_inspections_out_service_percent,
                                        :crash_fatal,
                                        :crash_injury,
                                        :crash_tow,
                                        :crash_total,
                                        :cad_vehicle_inspections,
                                        :cad_driver_inspections,
                                        :cad_vehicle_out_of_service,
                                        :cad_driver_out_of_service,
                                        :cad_vehicle_out_of_service_percent,
                                        :cad_driver_out_of_service_percent,
                                        :us_inspections_prev_24,
                                        :cad_inspections_prev_24,
                                        :crash_results_24_prior, 
                                        :cad_crash_results_24_prior, 
                                        :cad_crash_fatal, 
                                        :cad_crash_injury, 
                                        :cad_crash_tow,  
                                        :cad_crash_total, 
                                        :us_inspection_results_for_24_months_prior_to,
                                        :total_inspections,
                                        :total_iep_inspections,
                                        :crash_inspections,
                                        :the_rating_below_is_current_as_of,
                                        :rating_date, 
                                        :review_date, 
                                        :review_rating,
                                        :review_type,
                                        :company_profile_id 
                                       )
  end
end




