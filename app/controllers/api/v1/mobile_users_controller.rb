
module Api
  module V1
    class MobileUsersController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!   
      def index
        mobile_users = MobileUser.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'Loaded', data: mobile_users}, status: :ok
      end
      
      def show
        mobile_user = MobileUser.find(params[:id])
        # driver = DriverUser.find(params[:driver_user_id]) 
        render json: {status: 'SUCCESS', message: 'Loaded', data: mobile_user}, status: :ok  
      end
      
      def new  
          # @driver = DriverUser.find(params[:driver_user_id])
        mobile_user = MobileUser.new
      end

      
      def create
        mobile_user = MobileUser.new(mobile_user_params)    
        
        if mobile_user.save
          render json: {status: 'SUCCESS', message: 'Load sent to mobile.', data: mobile_user}, status: :ok   
        else
          render json: {status: 'ERROR', message: 'Load not sent.', data: mobile_user, errors: mobile_user.errors.full_messages}, status: :unprocessable_entity  
        end  
      end
      
       
      private

      # def mobile_user_params 
      #   params.require(:mobile_user).permit(:accept, :decline, :driver_user_id, :mobile_user, :driver_email)
      # end   
      
      def mobile_user_params 
        params.permit(
                      :mobile_user, 
                      :email,
                      :username,
                      :password,
                      :driver_user_id,
                      :type, 
                      :data
                      )      
      end   
    end
  end 
end


