steve = CompanyUser.create(
  password: "password", 
  password_confirmation: "password", 
  first_name: "Steve",
  last_name: "Chesnowtiz",
  email: "steve@transportationiq.com",
  cellphone: "7169864010",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,  
  city: Faker::Address.city,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: "true",
  admin: "true",
  employment_status: "active"
  ) 
  puts steve.inspect
  
kathy = CompanyUser.create(
  password: "password",
  password_confirmation: "password",  
  first_name: "Kathy",
  last_name: "Rodriguez",
  email: "kathy@@transportationiq.com",
  cellphone: "7169864010",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: Faker::Address.city,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: "true",
  admin: "true",
  employment_status: "active"
  )
  puts kathy.inspect



leadfoot = DriverUser.create(
  password: "password1",
  password_confirmation: "password1", 
  first_name: "Joe",
  last_name: "Leadfoot",
  email: "leadfoot@example.com", 
  cellphone: "7169864010",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: Faker::Address.city,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number, 
  employment_status: "active",
  company_driver: true,
  driver_rate_id: 40
  )
  puts leadfoot.inspect
  
# stumpy = DriverUser.create(
#   password: "password1", 
#   password_confirmation: "password1", 
#   first_name: "Stumpy",
#   last_name: "McGillacuddy",
#   email: "stumpy@example.com", 
#   cellphone: "7169864010",  
#   street: Faker::Address.street_name,
#   telephone: Faker::PhoneNumber.phone_number,
#   city: Faker::Address.city,
#   zip: "123456",
#   emergency_contact: Faker::Name.first_name,
#   emergency_contact_number: Faker::PhoneNumber.phone_number,
#   employment_status: "active",
#   company_driver: true,
#   driver_rate_id: 30
#   )
#   puts stumpy.inspect
  
  # slowmoe = DriverUser.create(
  # password: "password1",
  # password_confirmation: "password1", 
  # first_name: "Slow",
  # last_name: "Moe",
  # email: "slow@example.com", 
  # cellphone: "7169864010",  
  # street: Faker::Address.street_name,
  # telephone: Faker::PhoneNumber.phone_number,
  # city: Faker::Address.city,
  # zip: "123456",
  # emergency_contact: Faker::Name.first_name,
  # emergency_contact_number: Faker::PhoneNumber.phone_number,
  # employment_status: "active",
  # owner_operator: true

  # )   
  # puts slowmoe.inspect
  
joe = DriverUser.create(
  password: "password1",
  password_confirmation: "password1", 
  first_name: "Joe",
  last_name: "Sixpack",
  email: "s.chesnowitz@gmail.com",   
  cellphone: "7169864010",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: Faker::Address.city,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  employment_status: "active",
  owner_operator: true,
  driver_rate_id: 20
  )
  puts joe.inspect    