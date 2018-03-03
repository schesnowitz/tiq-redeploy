# class DriverLocationsController < ApplicationController
#   before_action :set_driver_location, only: [:show, :edit, :update, :destroy]

#   # GET /driver_locations
#   # GET /driver_locations.json
#   def index
#     @driver = DriverUser.find(params[:driver_user_id])    
#     @driver_locations = DriverLocation.all.order("created_at DESC") 
#   end

#   # GET /driver_locations/1
#   # GET /driver_locations/1.json
#   def show
#     @driver = DriverUser.find(params[:driver_user_id])
#     # @driver_locations = DriverLocation.where({ driver_email: @driver.email })
#   end

#   # GET /driver_locations/new 
#   def new
#     @driver = DriverUser.find(params[:driver_user_id])
#     @driver_location = DriverLocation.new
#   end

#   # GET /driver_locations/1/edit
#   def edit
#     @driver = DriverUser.find(params[:driver_user_id])
#   end

#   # POST /driver_locations
#   # POST /driver_locations.json
#   def create
    
#     @driver_location = DriverLocation.new(driver_location_params)

#     respond_to do |format|
#       if @driver_location.save
#         format.html { redirect_to @driver_location, notice: 'Driver location was successfully created.' }
#         format.json { render :show, status: :created, location: @driver_location }
#       else
#         format.html { render :new }
#         format.json { render json: @driver_location.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /driver_locations/1
#   # PATCH/PUT /driver_locations/1.json
#   def update
#     respond_to do |format|
#       if @driver_location.update(driver_location_params)
#         format.html { redirect_to @driver_location, notice: 'Driver location was successfully updated.' }
#         format.json { render :show, status: :ok, location: @driver_location }
#       else
#         format.html { render :edit }
#         format.json { render json: @driver_location.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /driver_locations/1
#   # DELETE /driver_locations/1.json
#   def destroy
#     @driver_location.destroy
#     respond_to do |format|
#       format.html { redirect_to driver_locations_url, notice: 'Driver location was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_driver_location
#       @driver_location = DriverLocation.find(params[:id]) 
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def driver_location_params
#       params.require(:driver_location).permit(:driver_email, 
#                                               :parse_id, 
#                                               :latitude, 
#                                               :longitude, 
#                                               :speed, 
#                                               :bearing, 
#                                               :parse_created_at, 
#                                               :parse_updated_at, 
#                                               :driver_user_id,
#                                               :geopoint
#                                               )
#     end
# end
