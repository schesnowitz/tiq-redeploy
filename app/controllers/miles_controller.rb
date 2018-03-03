class MilesController < ApplicationController
  before_action :set_mile, only: [:show, :edit, :update, :destroy]

  # GET /miles
  # GET /miles.json
  def index
    @miles = Mile.all
  end

  # GET /miles/1
  # GET /miles/1.json
  def show
  end

  # GET /miles/new
  def new
    @mile = Mile.new
  end

  # GET /miles/1/edit
  def edit
  end

  # POST /miles
  # POST /miles.json
  def create
    @mile = Mile.new(mile_params)

    respond_to do |format|
      if @mile.save
        format.html { redirect_to @mile, notice: 'Mile was successfully created.' }
        format.json { render :show, status: :created, location: @mile }
      else
        format.html { render :new }
        format.json { render json: @mile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miles/1
  # PATCH/PUT /miles/1.json
  def update
    respond_to do |format|
      if @mile.update(mile_params)
        format.html { redirect_to @mile, notice: 'Mile was successfully updated.' }
        format.json { render :show, status: :ok, location: @mile }
      else
        format.html { render :edit }
        format.json { render json: @mile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miles/1
  # DELETE /miles/1.json
  def destroy
    @mile.destroy
    respond_to do |format|
      format.html { redirect_to miles_url, notice: 'Mile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mile
      @mile = Mile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mile_params
      params.require(:mile).permit(:mileage, :type, :notes)
    end
end
