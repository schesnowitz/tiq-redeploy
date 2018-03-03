class TrailerImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @trailer_images = TrailerImage.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @trailer = Trailer.find(params[:trailer_id])
  end

  # GET /images/new
  def new
    @trailer = Trailer.find(params[:trailer_id])
    @trailer_image = @trailer.trailer_images.new
  end

  # GET /images/1/edit
  def edit
    @trailer = Trailer.find(params[:trailer_id])
  end

  # POST /images
  # POST /images.json
  def create
    @trailer = Trailer.find(params[:trailer_id])
    @trailer_image = @trailer.trailer_images.new(image_params)

    respond_to do |format|
      if @trailer_image.save
        format.html { redirect_to @trailer, notice: 'Trailer Image was successfully created.' }
        format.json { render :show, status: :created, location: @trailer_image }
      else
        format.html { render :new }
        format.json { render json: @trailer_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    @trailer = Trailer.find(params[:trailer_id])
    respond_to do |format|
      if @trailer_image.update(image_params)
        format.html { redirect_to @trailer_image, notice: 'Trailer Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer_image }
      else
        format.html { render :edit }
        format.json { render json: @trailer_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @trailer = Trailer.find(params[:trailer_id])
    @trailer_image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Trailer Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @trailer_image = TrailerTrailerImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:trailer_image).permit(:notes, :image_file, :trailer_id)
    end
end
