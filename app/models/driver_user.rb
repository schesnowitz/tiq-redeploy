class DriverUser < User
  has_many :loads
  has_one :trailer  
  has_many :driver_statements, through: :loads 
  has_many :driver_statements
  has_many :messages  
  belongs_to :driver_rate      
  has_many :load_to_mobiles, dependent: :destroy  
  has_one :mobile_user, dependent: :destroy   
  has_many :driver_locations  
  accepts_nested_attributes_for :mobile_user
 
  has_one :truck  
  

  # after_create :mobile_user_create  #see below this is a parse thing
  # after_update :mobile_user_update 
  
#   def test_user
# user = client.user({
#   :username => "cooldude6",
#   :password => "p_n7!-e8",
#   :phone => "415-392-0202"
# })
# user.save
# end




  
  
  # def mobile_user_create
  #   data = {
  #       email: self.email, 
  #       username: self.email, 
  #       password: self.password,
  #       note: "see note",
  #       driver_user_id: self.id,
        
  #   }
  #   user = Parse::User.create data
  # end 
  
  # def mobile_user_update
  #   data = {
  #       email: self.email, 
  #       username: self.email, 
  #       password: "password",
  #       note: "see note",
  #       driver_user_id: self.id,

  #   } 
  #   user = Parse::User.authenticate
  #   user = Parse::User.login(self.email, self.password)
  #   user = Parse::User.save data
  # end

  # validates :driver_rpm, :numericality => { :only_decimal => true, on: :update,
  #   :message => "Set A Rate - Select 0.00 if Owner Operator" } 
  ransack_alias :driver_search_params,
  :first_name_or_last_name_or_email 
  mount_uploader :profile_image, UserProfileImageUploader  
  mount_uploader :profile_bg, UserBackgroundImageUploader     

  def active_loads
    loads.where(["status_name = ?", "Active"]).count 
  end

  def plus_one_cell
    '+1'+self.cellphone 
  end

  def driver_rate_set_in_model 
    self.driver_rate.amount 
  end
  
  def driver_type
    if self.owner_operator == "true"
      return "Owner Operator"
    end  
    if self.company_driver == "true"
        return "Company Driver"
    end
  end
  

 private
 
  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end 
  
  def self.import(file)	
  	CSV.foreach(file.path, headers: true) do |row|
    	DriverUser.create! row.to_hash
  	end
  end   

  def is_company_driver
    if self.company_driver == true 
      return "Company Driver"     
    end  
  end
     
  def is_owner_operator
    if self.owner_operator == true 
      return "Owner"
    end 
  end
  
  def is_owner_operator_pbm
    if self.owner_operator_pbm == true 
      return "Owner *PAID BY MILE" 
    end 
  end
  

  def driver_name_and_type
    "#{full_name} | #{is_company_driver} #{is_owner_operator}"  
  end
  
# T R U C K S


#-------------------truck_year------------------------
  def truck_year
    if self.truck.present?  
      return self.truck.year.strftime("%Y")
    else
      return ""
    end
  end
  
  def show_truck_year
    "#{truck_year}"  
  end  
#-------------------end_truck_year--------------------

#-------------------truck_make------------------------
  def truck_make
    if self.truck.present?    
      return self.truck.make 
    else
      return ""
    end
  end

  def show_truck_make
    "#{truck_make}"  
  end
#-------------------end_truck_make--------------------

#-------------------truck_model-----------------------
  def truck_model
    if self.truck.present?    
      return self.truck.model 
    else
      return ""
    end
  end  
  
  def show_truck_model
    "#{truck_model}"  
  end  
#-------------------end_truck_model------------------- 

#-------------------truck_color-----------------------
  def truck_color
    if self.truck.present?   
      return self.truck.color 
    else
      return ""
    end
  end  
  
  def show_truck_color
    "#{truck_color}"  
  end  
#-------------------end_truck_color-------------------
  
#-------------------truck_number----------------------
  def truck_number
    if self.truck.present?   
      return self.truck.number 
    else
      return "No Truck Assigned"
    end
  end
  
  def show_truck_number
    "#{truck_number}"  
  end 
#-------------------end_truck_number------------------
  
#-------------------truck_service_status--------------
  def truck_service_status
    if self.truck.present?   
      return self.truck.service_status 
    else
      return ""
    end
  end  
  
  def show_truck_service_status
    "#{truck_service_status}"  
  end 
#-------------------end_truck_service_status----------

#-------------------truck_vin-------------------------
  def truck_vin
    if self.truck.present?     
      return self.truck.vin 
    else
      return ""
    end
  end  
  
  def show_truck_vin
    "#{truck_vin}"  
  end 
#-------------------end_truck_vin---------------------

#-------------------truck_plate_state-----------------
  def truck_plate_state
    if self.truck.present?   
      return self.truck.plate_state 
    else
      return ""
    end
  end  
  def show_truck_state
    "#{truck_plate_state}"   
  end 
#-------------------end_truck_plate state-------------
  
#-------------------truck_plate-----------------------
  def truck_plate
    if self.truck.present?   
      return self.truck.plate 
    else
      return ""
    end
  end  
  
  def show_truck_plate
    "#{truck_plate}"  
  end 
#-------------------end_truck_plate-------------------

#-------------------truck_MPG-----------------------
  def truck_mpg
    if self.truck.present?   
      return self.truck.average_mpg 
    else
      return ""
    end
  end  
  
  def show_truck_mpg
    "#{truck_mpg}"   
  end 
#-------------------end_truck_MPG-------------------


# Trailers 

  
#-------------------trailer_length--------------------
  def trailer_length
    if self.trailer.present?   
      return self.trailer.length
    else
      return ""
    end
  end  
  
  def show_trailer_length
    "#{trailer_length}"   
  end 
#-------------------end_trailer_length---------------- 
  
#-------------------trailer_door_type-----------------
  def trailer_door_type
    if self.trailer.present? 
      return self.trailer.door_type 
    else
      return ""
    end
  end 
  def show_trailer_door_type
    "#{trailer_door_type}"  
  end 
#-------------------end_trailer_door_type------------- 
  
#-------------------trailer_type----------------------
  
  def trailer_type
    if self.trailer.present?  
      return self.trailer.trailer_type 
    else
      return ""
    end
  end
  
  def show_trailer_type
    "#{trailer_type}"  
  end 
#-------------------end_trailer_type------------------
  
#-------------------trailer_year----------------------
  def trailer_year
    if self.trailer.present?  
      return self.trailer.year.strftime("%Y")  
    else
      return ""
    end
  end
  
  def show_trailer_year
    "#{trailer_year}"  
  end  
#-------------------end_trailer_year------------------

#-------------------trailer_make----------------------
  def trailer_make
    if self.trailer.present?
      return self.trailer.make 
    else
      return ""
    end
  end

  def show_trailer_make
    "#{trailer_make}"  
  end
#-------------------end_trailer_make------------------

#-------------------trailer_model---------------------
  def trailer_model
    if self.trailer.present?
      return self.trailer.model 
    else
      return ""
    end
  end  
  
  def show_trailer_model
    "#{trailer_model}"  
  end  
#-------------------end_trailer_model----------------- 

#-------------------trailer_color---------------------
  def trailer_color
    if self.trailer.present?  
      return self.trailer.color 
    else
      return ""
    end
  end  
  
  def show_trailer_color
    "#{trailer_color}"  
  end  
#-------------------end_trailer_color-----------------
  
#-------------------trailer_number--------------------
  def trailer_number
    if self.trailer.present?
      return self.trailer.number 
    else
      return "No Trailer Assigned"
    end
  end
  
  def show_trailer_number
    "#{trailer_number}"  
  end 
#-------------------end_trailer_number----------------
  
#-------------------trailer_service_status------------
  def trailer_service_status
    if self.trailer.present?  
      return self.trailer.service_status 
    else
      return ""
    end
  end  
  
  def show_trailer_service_status
    "#{trailer_service_status}"  
  end 
#-------------------end_trailer_service_status--------

#-------------------trailer_vin-----------------------
  def trailer_vin
    if self.trailer.present?   
      return self.trailer.vin 
    else
      return ""
    end
  end  
  
  def show_trailer_vin
    "#{trailer_vin}"  
  end 
#-------------------end_trailer_vin-------------------

#-------------------trailer_state---------------------
  def trailer_plate_state
    if self.trailer.present?
      return self.trailer.plate_state 
    else
      return ""
    end
  end  
  def show_trailer_state
    "#{trailer_plate_state}"  
  end 
#-------------------end_trailer_state----------------- 
  
#-------------------trailer_plate---------------------
  def trailer_plate
    if self.trailer.present?  
      return self.trailer.plate 
    else
      return ""
    end
  end  
  
  def show_trailer_plate
    "#{trailer_plate}"  
  end 
#-------------------end_trailer_plate----------------- 


# sets trailer type info into ':trailer_type' of load model
  def show_all_truck_trailer_info  
    
    "Truck Number: #{truck_number}, Truck Year: #{truck_year}," + 
    "Truck Make: #{truck_make}, Truck Model: #{truck_model}, " +
    "Truck Plate: #{truck_plate}," +
    "Truck State: #{truck_plate_state}, Truck Vin: #{truck_vin}" +  
    "Trailer Number: #{trailer_number}, Trailer Year: #{trailer_year}," + 
    "Trailer Make: #{trailer_make}, Trailer Type: #{trailer_type}, " +
    "Trailer Length: #{trailer_length}, Trailer Plate: #{trailer_plate}, " + 
    "Trailer State: #{trailer_plate_state}, Trailer Vin: #{trailer_vin}"  
  end 







  
  
  
  

end

