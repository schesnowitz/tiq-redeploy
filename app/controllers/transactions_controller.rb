class TransactionsController < ApplicationController
  before_action :set_load_expense, only: [:show, :edit, :update, :destroy]
  before_action :validate_company_user, only: [:edit, :update, :new, :destroy] 


  def index
    @transactions = Transaction.all
    @load = Load.find(params[:load_id])  
  end


  def show
    @load = Load.find(params[:load_id])  
  end


  def new
    @load = Load.find(params[:load_id])
    @transaction = @load.transactions.new
    #@vendor_profile = VendorProfile.all
  end 


  def edit
    @load = Load.find(params[:load_id])
    @vendor_profile = VendorProfile.all
  end


  def create
    @vendor_profile = VendorProfile.all
    @load = Load.find(params[:load_id])
    @transaction = @load.transactions.create(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @load, notice: 'Load expense was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @load = Load.find(params[:load_id])
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @load, notice: 'Load expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @load = Load.find(params[:load_id])
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to @load, notice: 'Load expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  

    def set_load_expense
      @transaction = Transaction.find(params[:id])
    end
    
    def validate_hrc_user
      if !current_hrc_user
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end

    def transaction_params
      params.require(:transaction).permit(
                                            :expense_type, 
                                            :debit, 
                                            :credit,
                                            :street, 
                                            :city, 
                                            :state, 
                                            :zip, 
                                            :business_name, 
                                            :transactionable_id,
                                            :transactionable_type,
                                            :latitude,
                                            :longitude,
                                            
                                            )
    end
end
