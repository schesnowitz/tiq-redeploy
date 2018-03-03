class Load < ApplicationRecord
  

  belongs_to :company_user 
  belongs_to :driver_user 
  belongs_to :company_profile    
  belongs_to :percentage
  has_many :transactions, as: :transactionable  
  accepts_nested_attributes_for :transactions 
  

  
  belongs_to :driver_statement, optional: true 
  has_many :load_documents, dependent: :destroy  


  has_many :load_origin_addresses, dependent: :destroy 
  accepts_nested_attributes_for :load_origin_addresses
  
  before_validation :set_company_driver_rate, :is_temperature_control_needed, :validate_the_weight

  before_validation :delivery_date, date: { after_or_equal_to: Proc.new { :pick_up_date }, 
  message: "(error) Delivery can't be before pick up" }, on: :create

  validates_presence_of :load_size, :pick_up_date, :national_average_diesel_price, 
  :driver_user_id, :company_profile, :rate_to_owner_operator, :status_name, 
  :invoice_price, :origin_street, :origin_city, :origin_state, :truck_make, :truck_number, :commodity, 
  :trailer_make, :trailer_number, :origin_zip, :broker_rep_name
  
  validates :destination_street, :destination_city, :miles, :destination_state, :delivery_date, :destination_zip, :kilometers,
  presence: true, unless: :has_multiple_pd?
  validates :percent_coverted_to_dollars, presence: true, unless: :is_company_driver
  validates :invoice_price, numericality: { other_than: 0.0 }  
  validates :percent_coverted_to_dollars, numericality: { other_than: 0.00 }

  ransack_alias :load_search_params,
  :driver_user_first_name_or_driver_user_last_name_or_origin_city_or_destination_city_or_origin_state_or_destination_state_or_company_profile_company_name_or_broker_shipper_load_id
 

  def is_temperature_control_needed
    if self.is_temp_control?
      validates_presence_of :fahrenheit, :celsius
    end
  end

  def validate_the_weight
    if self.is_pounds? || self.is_kilos?
      validates_presence_of :pounds, :kilos
    end
  end
 
  def is_company_driver
      driver_user.try(:company_driver) == true
  end
  
  def set_company_driver_rate
    self.rate_to_owner_operator = 0.00 if is_company_driver
  end
  

  def destination
    load_origin_addresses.where(["address_category_id = ?", 4]).last 
  end
  
  def destination_map
    load_origin_addresses('created_at desc').last  
  end

  
  def title
    if self.destination_city.present? && self.destination_state.present?
      " Origin: " + self.origin_city + " " + self.origin_state + " " + "Destination: " + 
      self.destination_city + " " + self.destination_state
    elsif self.origin_city.present? && self.origin_state.present? && destination.present?
       " Origin: " + self.origin_city + " " + self.origin_state + " " + "Destination: " + 
      destination.city + " " + destination.state
    elsif self.origin_city.present? && self.origin_state.present? && !destination.present?
       " Origin: " + self.origin_city + " " + self.origin_state + " " + "Destination: *None Set*" 
    end
  end

  def origin_address
    return self.origin_street + ", " + self.origin_city + ", " + self.origin_state + ", " + self.origin_zip
  end
  
  def destination_address
    if destination.try(:city).blank? and destination.try(:state).blank?
    return self.destination_street + ", " + self.destination_city + ", " + self.destination_state + ", " + self.destination_zip
    else
    destination.street + " " + destination.city + " " + destination.state + " " + destination.zip  
    end
  end

  def has_multiple_deliveries
    if self.has_multiple_pd?
      return "Yes"
    else
      return "No"
  end
end

  def has_hazmat
    if self.is_hazmat?
      return "Yes" 
    else
      return "No"
  end
end

  def needs_temp_control_model
    if self.is_temp_control?
      return "Yes" 
    else
      return "No"
    end
  end

  def destination_address
    if destination.try(:city).blank? and destination.try(:state).blank?
    return self.destination_street + ", " + self.destination_city + ", " + self.destination_state + ", " + self.destination_zip
    else
    destination.street + " " + destination.city + " " + destination.state + " " + destination.zip  
    end
  end

  
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
    	Load.create! row.to_hash     
    end
  end  
end
