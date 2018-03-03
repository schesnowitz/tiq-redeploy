class AppVariablesController < ApplicationController
  before_action :set_app_variable, only: [:show, :edit, :update, :destroy]

  # GET /app_variables
  # GET /app_variables.json
  def index
    @app_variables = AppVariable.all
  end

  # GET /app_variables/1
  # GET /app_variables/1.json
  def show
  end

  # GET /app_variables/new
  # def new
  #   @app_variable = AppVariable.new
  # end

  # GET /app_variables/1/edit
  def edit
  end

  # POST /app_variables
  # POST /app_variables.json
  def create
    @app_variable = AppVariable.new(app_variable_params)

    respond_to do |format|
      if @app_variable.save
        format.html { redirect_to @app_variable, notice: 'App variable was successfully created.' }
        format.json { render :show, status: :created, location: @app_variable }
      else
        format.html { render :new }
        format.json { render json: @app_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_variables/1
  # PATCH/PUT /app_variables/1.json
  def update
    respond_to do |format|
      if @app_variable.update(app_variable_params)
        format.html { redirect_to @app_variable, notice: 'App variable was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_variable }
      else
        format.html { render :edit }
        format.json { render json: @app_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_variables/1
  # DELETE /app_variables/1.json
  # def destroy
  #   @app_variable.destroy
  #   respond_to do |format|
  #     format.html { redirect_to app_variables_url, notice: 'App variable was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_variable
      @app_variable = AppVariable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_variable_params
      params.require(:app_variable).permit(
                                            :front_end_color, 
                                            :app_name,
                                            :app_logo,
                                            :app_logo_text,
                                            :app_tab_text,
                                            :app_slogan,
                                            :app_favi,
                                            :app_frontend_logo_text,
                                            :email,
                                            :telephone,
                                            :street,
                                            :city,
                                            :state,
                                            :zip,
                                            :street_2,
                                            :city_2,
                                            :state_2,
                                            :zip_2,
                                            :app_terms,
                                            :app_conditions,
                                            :theme, 
                                            :string_1,
                                            :string_2,
                                            :string_3,
                                            :string_4,
                                            :string_5,
                                            :string_6,
                                            :string_7,
                                            :string_8,
                                            :string_9,
                                            :string_10,
                                            :string_11,
                                            :string_12,
                                            :string_13,
                                            :string_14,
                                            :string_15,
                                            :string_16,
                                            :string_17,
                                            :string_18,
                                            :string_19,
                                            :string_20,
                                            :string_21,
                                            :string_22,
                                            :string_23,
                                            :string_24,
                                            :string_25,
                                            :string_26,
                                            :string_27,
                                            :string_28,
                                            :string_29,
                                            :string_30,
                                            :text_1,
                                            :text_2,
                                            :text_3,
                                            :text_4,
                                            :text_5,
                                            :text_6,
                                            :text_7,
                                            :text_8,
                                            :text_9,
                                            :text_10,
                                            :text_11,
                                            :text_12,
                                            :text_13,
                                            :text_14,
                                            :text_15,
                                            :text_16,
                                            :text_17,
                                            :text_18,
                                            :text_19,
                                            :text_20,
                                            :icon_1,
                                            :icon_2,
                                            :icon_3,
                                            :icon_4,
                                            :icon_5,
                                            :icon_6,
                                            :icon_7,
                                            :icon_8,
                                            :icon_9,
                                            :icon_10,
                                            :icon_11,
                                            :icon_12,
                                            :icon_13,
                                            :icon_14,
                                            :icon_15,
                                            :icon_16,
                                            :icon_17,
                                            :icon_18,
                                            :icon_19,
                                            :icon_20,
                                            :icon_21,
                                            :icon_22,
                                            :icon_23,
                                            :icon_24,
                                            :icon_25,
                                            :icon_26,
                                            :icon_27,
                                            :icon_28,
                                            :icon_29,
                                            :icon_30,
                                            :app_company_name,

                                            ) 
    end
end
