class TrailersController < ApplicationController
  before_action :set_trailer, only: [:show, :edit, :update, :destroy]
  before_action :validate_company_user, except: [:show]  

  def index
    @trailers = Trailer.all
    
    respond_to do |format|
      format.html
      format.csv { send_data @trailers.as_csv }  
    end
  end


  def show
    @trailer_mile = TrailerMile.new
    @trailer_miles = @trailer.trailer_miles 
    @trailer_image = TrailerImage.new
    @trailer_images = @trailer.trailer_images 
    @driver = @trailer.driver_user        
  end


  def new
    # @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @trailer = Trailer.new
  end


  def edit
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
  end


  def create
    # @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @trailer = Trailer.new(trailer_params)

    respond_to do |format|
      if @trailer.save
        format.html { redirect_to @trailer, notice: 'Trailer was successfully created.' }
        format.json { render :show, status: :created, location: @trailer }
      else
        flash[:error] = @trailer.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trailers/1
  # PATCH/PUT /trailers/1.json
  def update
    respond_to do |format|
      if @trailer.update(trailer_params)
        format.html { redirect_to @trailer, notice: 'Trailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer }
      else        
        flash[:error] = @trailer.errors.full_messages.to_sentence
        format.html { redirect_back(fallback_location: trailers_path) } 
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailers/1
  # DELETE /trailers/1.json
  def destroy
    @trailer.destroy
    respond_to do |format|
      format.html { redirect_to trailers_url, notice: 'Trailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    Trailer.import(params[:file])
    redirect_to trailers_path, notice: 'Trailers have been uploaded.'
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer
      @trailer = Trailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trailer_params
      params.require(:trailer).permit(
                                      :year, 
                                      :make, 
                                      :model, 
                                      :color, 
                                      :number, 
                                      :service_status, 
                                      :vin, 
                                      :image, 
                                      :notes,
                                      :length,
                                      :door_type,
                                      :driver_user_id,
                                      :gps_unit_ident,
                                      :latitude,
                                      :longitude,
                                      :plate,
                                      :plate_state,
                                      :trailer_type,
                                      :add_remove_driver
                                      )
    end
end
