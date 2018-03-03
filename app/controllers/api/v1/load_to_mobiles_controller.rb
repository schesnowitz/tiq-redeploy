module Api
  module V1
    class LoadToMobilesController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!   
      def index
        load_to_mobiles = LoadToMobile.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'Loaded', data: load_to_mobiles}, status: :ok
      end
      
      def show
        load_to_mobile = LoadToMobile.find(params[:id])
        # driver = DriverUser.find(params[:driver_user_id]) 
        render json: {status: 'SUCCESS', message: 'Loaded', data: load_to_mobile}, status: :ok  
      end
      
      
      
      def create
        load_to_mobile = LoadToMobile.new(creation_params)    
        
        if load_to_mobile.save
          render json: {status: 'SUCCESS', message: 'Load sent to mobile.', data: load_to_mobile}, status: :ok   
        else
          render json: {status: 'ERROR', message: 'Load not sent.', data: load_to_mobile, errors: load_to_mobile.errors.full_messages}, status: :unprocessable_entity  
        end  
      end
      
       
      private

      def load_to_mobile_params 
        params.require(:load_to_mobile).permit(:accept, :decline, :driver_user_id, :load_to_mobile, :driver_email)
      end   
      
      def creation_params
        params.permit(:load_to_mobile, :accept, :decline, :driver_user_id, :driver_email, :data)      
      end   
      
    end
  end 
end