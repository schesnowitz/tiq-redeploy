class VendorProfile < ApplicationRecord
  has_many :load_expenses, dependent: :destroy 
  
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
    	VendorProfile.create! row.to_hash
  	end
  end  
end