class MessagesController < ApplicationController
  include TwilioHelper
  skip_before_action :verify_authenticity_token
  # before_action :authenticate_company_user! 





  def index
    @company_user = current_company_user
    @driver = DriverUser.find(params[:cellphone])
    @messages = Message.for_number(params[:id])
    @new_message = Message.new(number: params[:id])
    @inbound = @messages.find_by(inbound: 'true') 
 

  end

  def show 
    @company_user = current_company_user
    @messages = Message.for_number(params[:id])
    @new_message = Message.new(number: params[:id])
    @inbound = @messages.find_by(inbound: 'true') 
  end

  def create
    @company_user = current_company_user

    message = Message.new(clean_params)
    message.inbound = false

    if message.save
     flash[:success] = "Your Text has been sent"
      send_cable(message)
      send_sms(message)

        redirect_back(fallback_location: root_path)
     else
       flash[:danger] = "There was a problem sending the message"
        redirect_back(fallback_location: root_path)
    end
  end
     

  private

  def clean_params
    params.require(:message).permit(
      :number, 
      :text, 
      :driver_user_id, 
      :user, 
      :body,
      :to_country,
      :to_state,
      :to_city,
      :to_zip,
      :from_country,
      :from_state,
      :from_city,
      :from_zip,
      :sms_message_sid,
      :num_media,
      :sms_sid      
      ) 
  end
end

