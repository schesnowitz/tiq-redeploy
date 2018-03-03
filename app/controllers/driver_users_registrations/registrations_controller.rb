class DriverUsersRegistrations::RegistrationsController < Devise::RegistrationsController 
  

  
  private

  def sign_up_params
    params.require(:driver_user).permit(:password, 
                                          :password_confirmation,
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
                                          :profile_bg,  
                                          :profile_image,
                                          :emergency_contact,
                                          :emergency_contact_number,
                                          :time_zone,
                                          :driver_rate_id,
                                          :amount,
                                          :parse_driver_id,
                                          :mobile_user_password 
                                          )
  end

  def account_update_params
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
                                          :profile_bg, 
                                          :profile_image,
                                          :emergency_contact,
                                          :emergency_contact_number,
                                          :time_zone,
                                          :flat_rpm_driver, 
                                          :driver_rpm,
                                          :company_driver,
                                          :owner_operator_pbm,
                                          :owner_operator,
                                          :driver_rate_id,
                                          :amount,
                                          :parse_driver_id,
                                          :mobile_user_password
                                          )
                              
                              
  end
end      

