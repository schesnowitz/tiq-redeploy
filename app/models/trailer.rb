class Trailer < ApplicationRecord
  # belongs_to :driver_user, optional: true 
  has_many :trailer_miles, dependent: :destroy
  has_many :trailer_images, dependent: :destroy
  # validates_presence_of :number, :make, :vin, :year, :service_status, :door_type, :add_remove_driver 
  # validates_uniqueness_of :number, :vin
  validates_presence_of :year
  mount_uploader :image, TrailerImageUploader 
  
  belongs_to :driver_user, optional: true 
  validates_uniqueness_of :driver_user, :on => :update, message: " error -- This driver already has a trailer assigned," + 
  " Unassign this Driver from their currnet trailer, then come back and try again."
  before_update :remove_driver 




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
    	Trailer.create! row.to_hash     
  	end
  end  
end
