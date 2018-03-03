class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy] 
  before_action :validate_company_user, except: [:show]   

  def index
    @driver = DriverUser.all 
    # @driver = DriverUser.all 
    @trucks = Truck.all
    respond_to do |format|
      format.html 
      format.csv { send_data @trucks.as_csv }  
    end
  end


  def show
    @truck_image = TruckImage.new
    @truck_images = @truck.truck_images
    @truck_mile = TruckMile.new  
    @truck_miles = @truck.truck_miles 
    @driver = @truck.driver_user 
  end


  def new
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @truck = Truck.new
  end


  def edit
    @driver = DriverUser.all
  end


  def create
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @truck = Truck.new(truck_params)

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck, notice: 'Truck was successfully created.' }
        format.json { render :show, status: :created, location: @truck }
 
      else
        flash[:error] = @truck.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to @truck, notice: 'Truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck }
      else
        flash[:error] = @truck.errors.full_messages.to_sentence
        format.html { redirect_back(fallback_location: trucks_path) }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to trucks_url, notice: 'Truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    Truck.import(params[:file])
    redirect_to trucks_path, notice: 'Trucks have been uploaded.'
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end
    
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.require(:truck).permit(
                                    :year, 
                                    :make, 
                                    :model, 
                                    :color, 
                                    :number, 
                                    :vin, 
                                    :image, 
                                    :service_status, 
                                    :plate, 
                                    :plate_state, 
                                    :add_remove_driver, 
                                    :belongs_to_company, 
                                    :average_mpg, 
                                    :driver_user_id, 
                                    :latitude, 
                                    :longitude, 
                                    :gps_unit_ident,
                                    :notes,
                                    :add_remove_driver
                                    )
    end
end
