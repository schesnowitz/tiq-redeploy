class LoadDocumentsController < ApplicationController
  before_action :set_load_document, only: [:show, :edit, :update, :destroy]
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy] 
  # GET /load_documents
  # GET /load_documents.json
  def index
    @load_documents = LoadDocument.all
  end


  def show
  end


  def new
    @load = Load.find(params[:load_id])
    @load_document = @load.load_documents.new
  end


  def edit
  end


  def create
    @load = Load.find(params[:load_id])
    @load_document = @load.load_documents.new(load_document_params)

    respond_to do |format|
      if @load_document.save
        format.html { redirect_to load_path(@load), notice: 'Load document was successfully created.' }
        format.json { render :show, status: :created, location: @load_document }
      else
        flash[:error] = @load_document.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @load_document.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @load_document.update(load_document_params)
        format.html { redirect_to load_path(@load), notice: 'Load document was successfully updated.' }
        format.json { render :show, status: :ok, location: @load_document }
      else
        flash[:error] = @load_document.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @load_document.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @load_document.destroy
    respond_to do |format|
      format.html { redirect_to load_documents_url, notice: 'Load document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_load_document
      @load_document = LoadDocument.find(params[:id])
    end


    def load_document_params
      params.require(:load_document).permit(
                                            :doc_file, 
                                            :note, 
                                            :load_id, 
                                            :file_type 
                                            )
    end
end
