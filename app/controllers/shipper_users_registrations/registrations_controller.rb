class ShipperUsersRegistrations::RegistrationsController < Devise::RegistrationsController 
  
  
  private

  def sign_up_params
    params.require(:shipper_user).permit(:password, 
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
                                          :time_zone 
                                          )
  end

  def account_update_params
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
                                          :profile_bg,  
                                          :profile_image,
                                          :emergency_contact,
                                          :emergency_contact_number,
                                          :company_profile_admin,
                                          :dispatcher,
                                          :office,
                                          :office,
                                          :maintenance,
                                          :time_zone 
                                          )
                              
                              
  end
end      

