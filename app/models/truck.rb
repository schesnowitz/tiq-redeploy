class Truck < ApplicationRecord 
  has_many :truck_miles, dependent: :destroy
  has_many :truck_images, dependent: :destroy 
  validates_presence_of :number, :make, :vin, :year, :service_status
  # validates_uniqueness_of :number, :vin
  mount_uploader :image, TruckImageUploader  
 
  belongs_to :driver_user, optional: true 
  validates_uniqueness_of :driver_user, :on => :update, message: " error -- This driver already has a truck assigned," + 
  " Unassign this Driver from their currnet truck, then come back and try again." 
  before_save :remove_driver  


  

  def remove_driver 
    if self.add_remove_driver == "remove_driver" 
      self.update_column :driver_user_id, nil
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
    	Truck.create! row.to_hash     
  	end
  end  
end



 private

