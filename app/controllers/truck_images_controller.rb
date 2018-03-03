class TruckImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @truck_images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @truck = Truck.find(params[:truck_id])
  end

  # GET /images/new
  def new
    @truck = Truck.find(params[:truck_id])
    @truck_image = @truck.truck_images.new
  end

  # GET /images/1/edit
  def edit
    @truck = Truck.find(params[:truck_id])
  end

  # POST /images
  # POST /images.json
  def create
    @truck = Truck.find(params[:truck_id])
    @truck_image = @truck.truck_images.new(image_params) 

    respond_to do |format|
      if @truck_image.save
        format.html { redirect_to truck_path(@truck), notice: 'The Trucks Image was successfully added.' } 
        format.json { render :show, status: :created, location: @truck_image }
      else
        flash[:error] = @truck_image.errors.full_messages.to_sentence
        format.html { redirect_to truck_path(@truck) }
        format.json { render json: @truck_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    @truck = Truck.find(params[:truck_id])
    respond_to do |format|
      if @truck_image.update(image_params)
        format.html { redirect_to truck_path(@truck), notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_image }
      else
        format.html { render :edit }
        format.json { render json: @truck_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @truck = Truck.find(params[:truck_id])
    @truck_image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Truck Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @truck_image = TruckImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:truck_image).permit(:notes, :image_file, :truck_id)
    end
end
