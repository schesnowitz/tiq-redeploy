truck1 = Truck.create(year: Faker::Date.between(10.years.ago, Date.today), 
                      number: Faker::Number.number(4),
                      make: "International",
                      model: "Big Daddy", 
                      color: "Red",
                      plate: "A4DR45",
                      plate_state: "Texas",
                      vin: Faker::Vehicle.vin,
                      service_status: 'In Service',
                      driver_user_id: 5
                      )
truck2 = Truck.create(year: Faker::Date.between(10.years.ago, Date.today),
                      number: Faker::Number.number(3), 
                      make: "Volvo",
                      model: "Blue Star",  
                      color: "Hot Pink",
                      plate: "5WE45T",
                      plate_state: "New York",
                      vin: Faker::Vehicle.vin,
                      service_status: 'In Service'
                      )
trailer1 = Trailer.create(:number => Faker::Number.number(6),
                          :year => Faker::Date.between(10.years.ago, Date.today),
                          :model => "wimpy",
                          :make => "Slougton",
                          :trailer_type => "Flatbed",
                          :length => "53",
                          :plate => "IUY787Y",
                          :plate_state => "Florida",
                          :vin => Faker::Vehicle.vin,
                          :door_type => "N/A",
                          :service_status => 'In Service',
                          :driver_user_id => 5
                          )
trailer2 = Trailer.create(:number => Faker::Number.number(3),
                          :year => Faker::Date.between(10.years.ago, Date.today),
                          :make => "Great Dane",
                          :model => "Big Ears",
                          :trailer_type => "Van",
                          :length => "53",
                          :plate => "565ASD5",
                          :plate_state => "Maine",
                          :vin => Faker::Vehicle.vin,
                          :door_type => "Swing",
                          :service_status => 'In Service'
                          )
  