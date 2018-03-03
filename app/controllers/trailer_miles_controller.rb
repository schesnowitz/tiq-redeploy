class TrailerMilesController < MilesController
  before_action :set_trailer_mile, only: [:show, :edit, :update, :destroy]


  def index
    @trailer_miles = TrailerMile.all
    @trailer = Trailer.find(params[:trailer_id])
  end


  def show
    @trailer = Trailer.find(params[:trailer_id])
  end


  def new
    @trailer = Trailer.find(params[:trailer_id])
    @trailer_mile = @trailer.trailer_miles.new
  end

  def edit
    @trailer = Trailer.find(params[:trailer_id])
  end


  def create
    @trailer = Trailer.find(params[:trailer_id])
    @trailer_mile = @trailer.trailer_miles.new(mile_params)

    respond_to do |format|
      if @trailer_mile.save 
        format.html { redirect_to trailer_path(@trailer), notice: 'Trailer Mileage was successfully created.' }
        format.json { render :show, status: :created, location: @trailer_mile }
      else
        format.html { render :new }
        format.json { render json: @trailer_mile.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @trailer = Trailer.find(params[:trailer_id])
    respond_to do |format|
      if @trailer_mile.update(mile_params)
        format.html { redirect_to trailer_path(@trailer), notice: 'Trailer Mileage was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer_mile }
      else
        format.html { render :edit }
        format.json { render json: @trailer_mile.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @trailer = Trailer.find(params[:trailer_id])
    @trailer_mile.destroy
    respond_to do |format|
      format.html { redirect_to trailer_path(@trailer), notice: 'Trailer Mileage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_trailer_mile
      @trailer_mile = Mile.find(params[:id])
    end


    def mile_params
      params.require(:trailer_mile).permit(:mileage, :type, :notes, :trailer_id)
    end
end
