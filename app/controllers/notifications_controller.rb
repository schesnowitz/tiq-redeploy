class NotificationsController < ApplicationController
   def create
    AgentTexter.alert(params).deliver
       flash[:success] = 'The text message has been sent.'
     redirect_to :back

   rescue Twilio::REST::RequestError => error
     redirect_to root_url,
       error: 'Oops! There was an error. Please try again.'

   end
 end