class DriverStatement < ApplicationRecord
  has_many :loads, dependent: :nullify 
  has_many :driver_users, through: :loads
  belongs_to :driver_user
  validates_presence_of :payment_status, :due_date, :insurance_payment, 
  :trailer_rental, :truck_rental, :other
  validates_presence_of :load_ids, on: :create  
  
ransack_alias :driver_statements_search_params,
  :driver_user_first_name_or_driver_user_last_name
  
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
    	DriverStatement.create! row.to_hash     
    end
  end  
end
