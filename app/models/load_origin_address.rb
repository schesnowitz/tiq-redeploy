class LoadOriginAddress < Address
  belongs_to :load
  belongs_to :address_category   
  geocoded_by :origin_address
  after_validation :geocode  
  validates_presence_of :city, :state, :street, :miles, :pick_up_date



  


  def origin_address
    [street, city, state, zip].join(', ')
  end
  
  def origin_city_state
    "Origin:  " + self.city + ", " + self.state  
  end 
  
end 
