class CompanyProfile < ApplicationRecord
  has_one :broker_mc, dependent: :destroy
  has_one :carrier_mc, dependent: :destroy
  has_one :us_dot, dependent: :destroy    
  after_create :create_carrier_mc
  after_create :create_broker_mc
  after_create :create_us_dot
  has_many :loads
  has_many :company_profile_membership, dependent: :destroy
  has_many :users, through: :company_profile_membership

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
    	CompanyProfile.create! row.to_hash     
  	end
  end  
  
end

      