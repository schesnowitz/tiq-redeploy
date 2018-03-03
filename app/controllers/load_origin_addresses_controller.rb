class LoadOriginAddressesController < AddressesController
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
    @driver = @load.driver_user
    @driver_email = @driver.email 

    @address = @load.load_origin_addresses.new 
    @loaa = @load.load_origin_addresses

    @load_origin_addresses = @load.load_origin_addresses.order("created_at asc")
    @load_origin_address = @load.load_origin_addresses.order("created_at asc").last


    
    @driver_locations = DriverLocation.where({ driver_email: @driver_email }).all.order('created_at desc')  
    @driver_location = @driver_locations.first   

    
  end

  def edit
    @load = Load.find(params[:load_id])
  end
  
  def create
    @load = Load.find(params[:load_id])
    @address = @load.load_origin_addresses.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to load_path(@load), notice: 'Load address was successfully created.' } 
        format.json { render :show, status: :created, location: @address }
      else
        flash[:error] = @address.errors.full_messages.to_sentence
        format.html { redirect_back(fallback_location: root_path) } 
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @load = Load.find(params[:load_id])
    respond_to do |format|

      if @address.update(address_params)
        format.html { redirect_to edit_load_path(@load), notice: 'Load address was successfully updated.' }
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
      params.require(:load_origin_address).permit(  
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
        :pick_up_date,
        :address_category_id
        )
        
    end

end

