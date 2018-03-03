class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy]    
  
  def index 
    @addresses = Address.all
  end

  def show
    @load = Load.find(params[:load_id])
  end

  def new
    @load = Load.find(params[:load_id])
    @address = Address.new
  end

  def edit
    @load = Load.find(params[:load_id])
  end


  def create
    @load = Load.find(params[:load_id])
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @load, notice: 'Load address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @load = Load.find(params[:load_id])
    respond_to do |format|

      if @address.update(address_params)
        format.html { redirect_to @load, notice: 'Load address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @load = Load.find(params[:load_id])
    @address.destroy
    respond_to do |format|
      format.html { redirect_to load_path(@load), notice: 'Load address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end
    


    def address_params
      params.require(:address).permit(
        :type, 
        :street, 
        :latitude, 
        :longitude, 
        :city, 
        :state, 
        :zip, 
        :company,  
        :contact, 
        :phone, 
        :load_id,
        :notes,
        :type,
        :pick_up_delivery,
        :miles,
        :pick_up_date
        )
       
    end

end

