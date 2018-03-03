module Dropdown
  extend ActiveSupport::Concern   



CompanyProfileMembershipStatus =
[ 
  
  "Member",
  "Non Member"
]
  
  PickupTimeNotes =
  [
    "Appointment Booked At"
  ]
  
  DeliveryTimeNotes =
  [
    "Appointment Booked At",
    "Multiple Deliveries",
    "Appointments with Multiple Deliveries"
  ]
     
  

  LoadSize =
  [
    "FTL",
    "LTL"
  ]

  AddressType =
  
  [ 
    "Destination",
    "Origin"
  ]
  
   States = 
  [
  'Alabama', 
  'Alaska', 
  'Arizona',
  'Arkansas', 
  'California', 
  'Colorado',
  'Connecticut',
  'Delaware', 
  'District of Columbia', 
  'Florida',
  'Georgia',
  'Hawaii', 
  'Idaho', 
  'Illinois', 
  'Indiana', 
  'Iowa', 
  'Kansas', 
  'Kentucky',
  'Louisiana',
  'Maine', 
  'Maryland', 
  'Massachusetts', 
  'Michigan',
  'Minnesota',
  'Mississippi',
  'Missouri', 
  'Montana', 
  'Nebraska', 
  'Nevada',
  'New Hampshire', 
  'New Jersey', 
  'New Mexico', 
  'New York', 
  'North Carolina',
  'North Dakota', 
  'Ohio', 
  'Oklahoma', 
  'Oregon', 
  'Pennsylvania',
  'Puerto Rico', 
  'Rhode Island', 
  'South Carolina', 
  'South Dakota', 
  'Tennessee', 
  'Texas', 
  'Utah', 
  'Vermont',
  'Virginia', 
  'Washington', 
  'West Virginia',
  'Wisconsin', 
  'Wyoming',
  "Ontario",
  "British Colombia",
  'Ontario',	
  'Quebec',
  'British Columbia',	
  'Alberta',
  'Manitoba',
  'Saskatchewan',
  'Nova Scotia',
  'New Brunswick',
  'Newfoundland - Labrador',	
  'Prince Edward Island',
  'Northwest Territories',	
  'Nunavut',	
  'Yukon'
  ]

      
    EmploymentStatus =
  [

    ["active", "active"],
    ["not_active", "not_active"]
  ]  
  
    AddRemoveDriver = 
  [
    ["Add new Driver", "add_or_keep_this_driver"],
    ["Keep current Driver", "add_or_keep_this_driver"],
    ["Remove this Driver", "remove_driver"],
    ["Unit has no Driver", "has_no_driver"]   
  ]  
  
    DeliveryStatus =
  [
    ["Waiting For Load"],    
    ["Driving to Pick Up"],
    ["At Pick Up - Waiting"],
    ["At Pick Up - Loading"],
    ["Driving to Deliver"],
    ["At Delivery - Waiting"],
    ["At Delivery - Unloading"],
    ["Off Duty"]
  ]    
  
  OfficeLocation =  
  [
    ["Buffalo"],
    ["Dallas"]
  ]     
    

  
    Yard = 
  [
    ['Buffalo', 'Buffalo'],
    ['Miami', 'Miami'],
    ['Dallas', 'Dallas'],
    ['Los Angeles', 'Los Angeles']
  ] 
  
  TruckTrailerStatus =   
  [
    ['Parked', 'Parked'],
    ['In Service', 'In Service'],
    ['In Shop', 'In Shop'],

    ['Not In Service', 'Not In Service'] 
  ]
  
    TrailerDoorType =   
  [
    ['Swing', 'Swing'],
    ['Roll Up', 'Roll Up'],
    ['Not applicable', 'Not applicable']
  ]
  

  ExpenseType =   
  [
    ['Fuel', 'Fuel'],
    ['Repair', 'Repair'],
    ['Lumper', 'Lumper'],
    ['Maintenance', 'Maintenance'],
    ['Cash Advance', 'Cash Advance'],
    ['Other', 'Other'] 
  ]    
  
    TrailerType =    
  [
    ['Van', 'Van'],
    ['Flatbed', 'Flatbed'],
    ['Reefer', 'Reefer'],
    ['RGN', 'RGN'],
    ['RollTight', 'RollTight'],
    ['Tanker', 'Tanker'],
    ['Other', 'Other']    
  ]     
  
  
  LoadStatusStatus =
  [
    ["Active", "Active" ],
    ["Pending", "Pending" ],
    ["Complete", "Complete" ],
    ["Cancelled", "Cancelled" ]
  ]
  
  DriverStatementPayment =
  [
    ["Paid", "Paid" ],
    ["Not Paid", "Not Paid" ],
    ["Void", "Void" ]
  ]
  
  
  LoadDocumentType =
  [
    ["Load Confirmation", "Load Confirmation"],
    ["BOL", "BOL"],
    ["Other", "Other"]
  ]
  

 
 DriverRpm =
    [
    ["0.00", "0.00"], 
    ["0.35", "0.35"],
    ["0.36", "0.36"]
    ]
    
 TruckMPG =
    [
 
    [4.5, 4.5],
    [5.0, 5.0],
    [5.5, 5.5],
    [6.0, 6.0],
    [6.5, 6.5],
    [7.0, 7.0],
    [7.5, 7.5], 
    [8.0, 8.0],    
    ]

    
 PickupDelivery =
    [
    ["Pick Up", "PU" ],
    ["Delivery", "D" ],
    ["Pick Up/Delivery", "PUD" ],  
    ["Final Destination", "FD" ] 
    ]

Theme = 
[    
["Cerulean", "Cerulean"],
["Cosmo", "Cosmo"],
["Cyborg", "Cyborg"],
["Darkly", "Darkly"], 
["Flatly", "Flatly"],
["Journal", "Journal"],
["Lumen", "Lumen"],
["Paper", "Paper"],
["Readable", "Readable"],
["Sandstone", "Sandstone"],
["Simplex", "Simplex"],
["Slate", "Slate"],
["Spacelab", "Spacelab"],
["Superhero", "Superhero"],
["United", "United"],
["Yeti", "Yeti"]
]

FeColor = 
[    
["Red", "Red"],
["Teal", "Teal"],
["Cyborg", "Cyborg"],
["Darkly", "Darkly"]
]


Commodity =
[
  "Household Goods",
  "Metal - sheets, coils, rolls",
  'Motor Vehicles',
  'Drive/Tow away',
  'Logs, Poles, Beams, Lumber',
  'Building Materials',
  'Machinery',
  'Fresh Produce',
  'Liquids/Gases',
  'Intermodal',
  'Oilfield Equipment',
  'Livestock',
  'Grain, Feed, Hay',
  'Coal/Coke',
  'Meat',
  'Garbage/Refuse',
  'US Mail',
  'Chemicals',
  'Commodities Dry Bulk',
  'Refrigerated Food',
  'Beverages',
  'Paper Products',
  'Utilities',
  'Agricultural/Farm Supplies',
  'Construction',
  'Water Well'
]
end

