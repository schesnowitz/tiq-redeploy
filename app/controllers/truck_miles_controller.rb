class TruckMilesController < MilesController
  before_action :set_truck_mile, only: [:show, :edit, :update, :destroy]


  def index
    @truck_miles = TruckMile.all
    @truck = Truck.find(params[:truck_id])
  end


  def show
    @truck = Truck.find(params[:truck_id])
  end


  def new
    @truck = Truck.find(params[:truck_id])
    @truck_mile = @truck.truck_miles.new
  end

  def edit
    @truck = Truck.find(params[:truck_id])
  end


  def create
    @truck = Truck.find(params[:truck_id])
    @truck_mile = @truck.truck_miles.new(mile_params)

    respond_to do |format|
      if @truck_mile.save 
        format.html { redirect_to truck_path(@truck), notice: 'Truck Mileage was successfully created.' }
        format.json { render :show, status: :created, location: @truck_mile }
      else
        format.html { render :new }
        format.json { render json: @truck_mile.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @truck = Truck.find(params[:truck_id])
    respond_to do |format|
      if @truck_mile.update(mile_params)
        format.html { redirect_to truck_path(@truck), notice: 'Truck Mileage was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_mile }
      else
        format.html { render :edit }
        format.json { render json: @truck_mile.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @truck = Truck.find(params[:truck_id])
    @truck_mile.destroy
    respond_to do |format|
      format.html { redirect_to truck_path(@truck), notice: 'Truck Mileage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_truck_mile
      @truck_mile = Mile.find(params[:id])
    end


    def mile_params
      params.require(:truck_mile).permit(:mileage, :type, :notes, :truck_id)
    end
end
