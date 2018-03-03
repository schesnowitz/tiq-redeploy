class FrontPageTextsController < ApplicationController
  before_action :set_front_page_text, only: [:show, :edit, :update, :destroy]

  # GET /front_page_texts
  # GET /front_page_texts.json
  def index
    @front_page_texts = FrontPageText.all
    @front_page = FrontPage.find(params[:front_page_id])
  end

  # GET /front_page_texts/1
  # GET /front_page_texts/1.json
  def show
    @front_page = FrontPage.find(params[:front_page_id])
  end

  # GET /front_page_texts/new
  def new
    @front_page_text = FrontPageText.new
    @front_page = FrontPage.find(params[:id])
  end

  # GET /front_page_texts/1/edit
  def edit
    # @fpt1 = @front_page.front_page_texts.find_by_id(5)
    @front_page = FrontPage.find(params[:front_page_id]) 
  end

  # POST /front_page_texts
  # POST /front_page_texts.json
  def create
    @front_page_text = FrontPageText.new(front_page_text_params)
    @front_page = FrontPage.find(params[:front_page_id])
    respond_to do |format|
      if @front_page_text.save
        format.html { redirect_to @front_page, notice: 'Front page text was successfully created.' }
        format.json { render :show, status: :created, location: @front_page }
      else
        format.html { render :new }
        format.json { render json: @front_page_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /front_page_texts/1
  # PATCH/PUT /front_page_texts/1.json
  def update
    respond_to do |format| 
      @front_page = FrontPage.find(params[:front_page_id])
      if @front_page_text.update(front_page_text_params)
        format.html { redirect_to edit_show_path, notice: 'Front page text was successfully updated.' }
        format.json { render :show, status: :ok, location: @front_page }
      else
        format.html { render :edit }
        format.json { render json: @front_page_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /front_page_texts/1
  # DELETE /front_page_texts/1.json
  def destroy 
    
    @front_page_text.destroy
    respond_to do |format|
      format.html { redirect_to front_page_texts_url, notice: 'Front page text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_front_page_text
      @front_page_text = FrontPageText.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def front_page_text_params
      params.require(:front_page_text).permit(:string_input, :text_input, :image_input, :front_page_id, :show_default_image)
    end
end


