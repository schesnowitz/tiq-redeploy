class FrontPagesController < ApplicationController
  before_action :set_front_page, only: [:show, :edit, :update, :edit_show, :drivers, :strategy, :support, :safety, :technology]
  before_action :set_page_variables, only: [:show,  :update, :destroy, :edit_show, :drivers, :strategy, :support, :safety, :technology]
  skip_before_action :authenticate_user!, except: [:edit_show]
  layout "front_pages"

  # GET /front_pages
  # GET /front_pages.json
  # def index 
  # end

  # GET /front_pages/1
  # GET /front_pages/1.json
  def show
    if current_company_user
      redirect_to company_dashboard_path
    elsif current_driver_user
      redirect_to driver_dashboard_path
    elsif current_shipper_user 
      redirect_to shipper_dashboard_path
    end
  end
  
  def edit_show
  end

  # GET /front_pages/new
  def new
    @front_page = FrontPage.new
  end
   
  def drivers
  end
  
  def strategy
  end
  
  def support
  end
  
  def safety
  end
  
  def technology
  end
  
  def logs
    @file_content = File.read('log/steve.log').last(500)  
  end
  
  
  def create
    @front_page = FrontPage.new(front_page_params)

    respond_to do |format|
      if @front_page.save
        format.html { redirect_to @front_page, notice: 'Front page was successfully created.' }
        format.json { render :show, status: :created, location: @front_page }
      else
        format.html { render :new }
        format.json { render json: @front_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /front_pages/1
  # PATCH/PUT /front_pages/1.json
  # def update
  #   respond_to do |format|
  #     if @front_page.update(front_page_params)
  #       format.html { redirect_to @front_page, notice: 'Front page was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @front_page }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @front_page.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /front_pages/1
  # DELETE /front_pages/1.json
  # def destroy
  #   @front_page.destroy
  #   respond_to do |format|
  #     format.html { redirect_to front_pages_url, notice: 'Front page was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_front_page
      @front_page = FrontPage.find_by(id: 1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def front_page_params
      params.require(:front_page).permit(:title)
    end
    
    def set_page_variables
      @fpt1 = @front_page.front_page_texts.find_by_id(1) 
      @fpt2 = @front_page.front_page_texts.find_by_id(2)
      @fpt3 = @front_page.front_page_texts.find_by_id(3)
      @fpt4 = @front_page.front_page_texts.find_by_id(4)
      @fpt5 = @front_page.front_page_texts.find_by_id(5)
      @fpt6 = @front_page.front_page_texts.find_by_id(6) 
      @fpt7 = @front_page.front_page_texts.find_by_id(7)
      @fpt8 = @front_page.front_page_texts.find_by_id(8)
      @fpt9 = @front_page.front_page_texts.find_by_id(9)
      @fpt10 = @front_page.front_page_texts.find_by_id(10)
      @fpt11 = @front_page.front_page_texts.find_by_id(11) 
      @fpt12 = @front_page.front_page_texts.find_by_id(12)
      @fpt13 = @front_page.front_page_texts.find_by_id(13)
      @fpt14 = @front_page.front_page_texts.find_by_id(14)
      @fpt15 = @front_page.front_page_texts.find_by_id(15)
      @fpt16 = @front_page.front_page_texts.find_by_id(16) 
      @fpt17 = @front_page.front_page_texts.find_by_id(17)
      @fpt18 = @front_page.front_page_texts.find_by_id(18)
      @fpt19 = @front_page.front_page_texts.find_by_id(19)
      @fpt20 = @front_page.front_page_texts.find_by_id(20)
      @fpt21 = @front_page.front_page_texts.find_by_id(21) 
      @fpt22 = @front_page.front_page_texts.find_by_id(22)
      @fpt23 = @front_page.front_page_texts.find_by_id(23)
      @fpt24 = @front_page.front_page_texts.find_by_id(24)
      @fpt25 = @front_page.front_page_texts.find_by_id(25)
      @fpt26 = @front_page.front_page_texts.find_by_id(26) 
      @fpt27 = @front_page.front_page_texts.find_by_id(27)
      @fpt28 = @front_page.front_page_texts.find_by_id(28)
      @fpt29 = @front_page.front_page_texts.find_by_id(29)
      @fpt30 = @front_page.front_page_texts.find_by_id(30)  
      @fpt31 = @front_page.front_page_texts.find_by_id(31)
      @fpt31 = @front_page.front_page_texts.find_by_id(31) 
      @fpt32 = @front_page.front_page_texts.find_by_id(32)
      @fpt33 = @front_page.front_page_texts.find_by_id(33)
      @fpt34 = @front_page.front_page_texts.find_by_id(34)
      @fpt35 = @front_page.front_page_texts.find_by_id(35)
      @fpt36 = @front_page.front_page_texts.find_by_id(36) 
      @fpt37 = @front_page.front_page_texts.find_by_id(37)
      @fpt38 = @front_page.front_page_texts.find_by_id(38)
      @fpt39 = @front_page.front_page_texts.find_by_id(39)
      @fpt40 = @front_page.front_page_texts.find_by_id(40)
      @fpt41 = @front_page.front_page_texts.find_by_id(41)
      @fpt41 = @front_page.front_page_texts.find_by_id(41) 
      @fpt42 = @front_page.front_page_texts.find_by_id(42)
      @fpt43 = @front_page.front_page_texts.find_by_id(43)
      @fpt44 = @front_page.front_page_texts.find_by_id(44)
      @fpt45 = @front_page.front_page_texts.find_by_id(45)
      @fpt46 = @front_page.front_page_texts.find_by_id(46) 
      @fpt47 = @front_page.front_page_texts.find_by_id(47)
      @fpt48 = @front_page.front_page_texts.find_by_id(48)
      @fpt49 = @front_page.front_page_texts.find_by_id(49)    
      @fpt50 = @front_page.front_page_texts.find_by_id(50) 
      @fpt51 = @front_page.front_page_texts.find_by_id(51)
      @fpt52 = @front_page.front_page_texts.find_by_id(52)
      @fpt53 = @front_page.front_page_texts.find_by_id(53)
      @fpt54 = @front_page.front_page_texts.find_by_id(54)
      @fpt55 = @front_page.front_page_texts.find_by_id(55)
      @fpt56 = @front_page.front_page_texts.find_by_id(56) 
      @fpt57 = @front_page.front_page_texts.find_by_id(57)
      @fpt58 = @front_page.front_page_texts.find_by_id(58)
      @fpt59 = @front_page.front_page_texts.find_by_id(59)    
      @fpt60 = @front_page.front_page_texts.find_by_id(60)
      @fpt61 = @front_page.front_page_texts.find_by_id(61)
      @fpt62 = @front_page.front_page_texts.find_by_id(62)
      @fpt63 = @front_page.front_page_texts.find_by_id(63)
      @fpt64 = @front_page.front_page_texts.find_by_id(64)
      @fpt65 = @front_page.front_page_texts.find_by_id(65)
      @fpt66 = @front_page.front_page_texts.find_by_id(66) 
      @fpt67 = @front_page.front_page_texts.find_by_id(67)
      @fpt68 = @front_page.front_page_texts.find_by_id(68)
      @fpt69 = @front_page.front_page_texts.find_by_id(69)    
      @fpt70 = @front_page.front_page_texts.find_by_id(70)
      @fpt71 = @front_page.front_page_texts.find_by_id(71)
      @fpt72 = @front_page.front_page_texts.find_by_id(72)
      @fpt73 = @front_page.front_page_texts.find_by_id(73)
      @fpt74 = @front_page.front_page_texts.find_by_id(74)
      @fpt75 = @front_page.front_page_texts.find_by_id(75)
      @fpt76 = @front_page.front_page_texts.find_by_id(76) 
      @fpt77 = @front_page.front_page_texts.find_by_id(77)
      @fpt78 = @front_page.front_page_texts.find_by_id(78)
      @fpt79 = @front_page.front_page_texts.find_by_id(79)    
      @fpt80 = @front_page.front_page_texts.find_by_id(80)   
      @fpt71 = @front_page.front_page_texts.find_by_id(71)
      @fpt72 = @front_page.front_page_texts.find_by_id(72)
      @fpt73 = @front_page.front_page_texts.find_by_id(73)
      @fpt74 = @front_page.front_page_texts.find_by_id(74)
      @fpt75 = @front_page.front_page_texts.find_by_id(75)
      @fpt76 = @front_page.front_page_texts.find_by_id(76) 
      @fpt77 = @front_page.front_page_texts.find_by_id(77)
      @fpt78 = @front_page.front_page_texts.find_by_id(78)
      @fpt79 = @front_page.front_page_texts.find_by_id(79)    
      @fpt80 = @front_page.front_page_texts.find_by_id(80)
      @fpt81 = @front_page.front_page_texts.find_by_id(81)
      @fpt82 = @front_page.front_page_texts.find_by_id(82)
      @fpt83 = @front_page.front_page_texts.find_by_id(83)
      @fpt84 = @front_page.front_page_texts.find_by_id(84)
      @fpt85 = @front_page.front_page_texts.find_by_id(85)
      @fpt86 = @front_page.front_page_texts.find_by_id(86) 
      @fpt87 = @front_page.front_page_texts.find_by_id(87)
      @fpt88 = @front_page.front_page_texts.find_by_id(88)
      @fpt89 = @front_page.front_page_texts.find_by_id(89)    
      @fpt90 = @front_page.front_page_texts.find_by_id(90)
      @fpt91 = @front_page.front_page_texts.find_by_id(91)
      @fpt92 = @front_page.front_page_texts.find_by_id(92)
      @fpt93 = @front_page.front_page_texts.find_by_id(93)
      @fpt94 = @front_page.front_page_texts.find_by_id(94)
      @fpt95 = @front_page.front_page_texts.find_by_id(95)
      @fpt96 = @front_page.front_page_texts.find_by_id(96) 
      @fpt97 = @front_page.front_page_texts.find_by_id(97)
      @fpt98 = @front_page.front_page_texts.find_by_id(98)
      @fpt99 = @front_page.front_page_texts.find_by_id(99)
      @fpt100 = @front_page.front_page_texts.find_by_id(100) 
      @fpt101 = @front_page.front_page_texts.find_by_id(101)
      @fpt102 = @front_page.front_page_texts.find_by_id(102) 
      @fpt103 = @front_page.front_page_texts.find_by_id(103)  
      @fpt104 = @front_page.front_page_texts.find_by_id(104) 
      @fpt105 = @front_page.front_page_texts.find_by_id(105) 
      @fpt106 = @front_page.front_page_texts.find_by_id(106) 
      @fpt107 = @front_page.front_page_texts.find_by_id(107) 
      @fpt108 = @front_page.front_page_texts.find_by_id(108) 
      @fpt109 = @front_page.front_page_texts.find_by_id(109) 
      @fpt110 = @front_page.front_page_texts.find_by_id(110) 
      @fpt111 = @front_page.front_page_texts.find_by_id(111)
      @fpt112 = @front_page.front_page_texts.find_by_id(112) 
      @fpt113 = @front_page.front_page_texts.find_by_id(113) 
      @fpt114 = @front_page.front_page_texts.find_by_id(114) 
      @fpt115 = @front_page.front_page_texts.find_by_id(115) 
      @fpt116 = @front_page.front_page_texts.find_by_id(116) 
      @fpt117 = @front_page.front_page_texts.find_by_id(117) 
      @fpt118 = @front_page.front_page_texts.find_by_id(118) 
      @fpt119 = @front_page.front_page_texts.find_by_id(119) 
      @fpt120 = @front_page.front_page_texts.find_by_id(120)     
      
      @fpt121 = @front_page.front_page_texts.find_by_id(121)
      @fpt122 = @front_page.front_page_texts.find_by_id(122) 
      @fpt123 = @front_page.front_page_texts.find_by_id(123) 
      @fpt124 = @front_page.front_page_texts.find_by_id(124) 
      @fpt125 = @front_page.front_page_texts.find_by_id(125) 
      @fpt126 = @front_page.front_page_texts.find_by_id(126) 
      @fpt127 = @front_page.front_page_texts.find_by_id(127) 
      @fpt128 = @front_page.front_page_texts.find_by_id(128) 
      @fpt129 = @front_page.front_page_texts.find_by_id(129) 
      @fpt130 = @front_page.front_page_texts.find_by_id(130)   
      
      @fpt131 = @front_page.front_page_texts.find_by_id(131)
      @fpt132 = @front_page.front_page_texts.find_by_id(132) 
      @fpt133 = @front_page.front_page_texts.find_by_id(133) 
      @fpt134 = @front_page.front_page_texts.find_by_id(134) 
      @fpt135 = @front_page.front_page_texts.find_by_id(135) 
      @fpt136 = @front_page.front_page_texts.find_by_id(136) 
      @fpt137 = @front_page.front_page_texts.find_by_id(137) 
      @fpt138 = @front_page.front_page_texts.find_by_id(138) 
      @fpt139 = @front_page.front_page_texts.find_by_id(139) 
      @fpt140 = @front_page.front_page_texts.find_by_id(140)    
      
      
      @fpt141 = @front_page.front_page_texts.find_by_id(141)
      @fpt142 = @front_page.front_page_texts.find_by_id(142) 
      @fpt143 = @front_page.front_page_texts.find_by_id(143) 
      @fpt144 = @front_page.front_page_texts.find_by_id(144) 
      @fpt145 = @front_page.front_page_texts.find_by_id(145) 
      @fpt146 = @front_page.front_page_texts.find_by_id(146) 
      @fpt147 = @front_page.front_page_texts.find_by_id(147) 
      @fpt148 = @front_page.front_page_texts.find_by_id(148) 
      @fpt149 = @front_page.front_page_texts.find_by_id(149) 
      @fpt150 = @front_page.front_page_texts.find_by_id(150)  
    end
end