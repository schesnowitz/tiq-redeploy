class TextMessagesController < ApplicationController
  include TwilioHelper
  skip_before_action :authenticate_user! 
  skip_before_action :verify_authenticity_token, :only => [:create]

  # If webhooks are set up as GET requests
  def index
    create_message(params)
  end
 
  # If webhooks are set up as POST requests
  def create
    create_message(params)
  end

  def create_message(params)
    message = Message.create!(
      number: params[:From],
      text: params[:Body], 
      from_country: params[:FromCountry], 
      from_state: params[:FromState], 
      from_city: params[:FromCity],
      from_zip: params[:FromZip],
      num_media: params[:NumMedia],
      sms_sid: params[:SmsSid],
      sms_message_sid: params[:SmsMessageSid],
      inbound: true
    )
    send_cable(message)
    render json: { state: 200 }
  end
end 


